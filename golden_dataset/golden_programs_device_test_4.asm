; DESCRIPTION: Display a object using color colored at the screen.

; device_test.asm -- Phase 28: Device Driver Abstraction demo
; Opens all 4 device files, uses IOCTL to query them,
; reads from /dev/keyboard, writes pixels to /dev/screen.
;
; Controls: Press any key to draw a pixel at a random position
; Opcodes: OPEN, READ, WRITE, IOCTL, LDI, LOAD, STORE, RAND, FRAME, HALT

; -- Data area --
.org 0xD00
screen_path:
    .db "/dev/screen", 0
kb_path:
    .db "/dev/keyboard", 0
audio_path:
    .db "/dev/audio", 0
net_path:
    .db "/dev/net", 0
pixel_buf:
    .db 0, 0, 0   ; x, y, color triplet for screen write
key_buf:
    .db 0         ; buffer for keyboard read
result:
    .db 0         ; stores ioctl results

; -- Main program --
.org 0x000
    ; Fill screen with dark blue background
    LDI r11, 0x000033
    FILL r11

    ; Draw title bar
    LDI r8, 0
    LDI r2, 0
    LDI r5, 256
    LDI r13, 16
    LDI r11, 0x003366
    RECTF r8, r2, r5, r13, r11

    ; Draw status bar at bottom
    LDI r8, 0
    LDI r2, 240
    LDI r5, 256
    LDI r13, 16
    LDI r11, 0x003366
    RECTF r8, r2, r5, r13, r11

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r8, screen_path
    LDI r2, 0
    OPEN r8, r2
    ; r1 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r8, kb_path
    LDI r2, 0
    OPEN r8, r2
    ; r1 = 0xE001 (keyboard fd), save to r9
    MOV r9, r1

    ; /dev/audio -> fd 0xE002
    LDI r8, audio_path
    LDI r2, 0
    OPEN r8, r2
    ; r1 = 0xE002 (audio fd), save to r4
    MOV r4, r1

    ; /dev/net -> fd 0xE003
    LDI r8, net_path
    LDI r2, 0
    OPEN r8, r2
    ; r1 = 0xE003 (net fd), save to r12
    MOV r12, r1

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r6, 0xE000
    LDI r0, 0
    LDI r10, 0
    IOCTL r6, r0, r10
    ; r1 = 256 (width), store it
    LDI r20, result
    STORE r20, r1

    ; Get screen height (cmd=1) -- should return 256
    LDI r6, 0xE000
    LDI r0, 1
    LDI r10, 0
    IOCTL r6, r0, r10
    ; r1 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r6, 0xE001
    LDI r0, 1
    LDI r10, 1
    IOCTL r6, r0, r10
    ; r1 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r6, 0xE002
    LDI r0, 1
    LDI r10, 50
    IOCTL r6, r0, r10
    ; r1 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r6, 0xE003
    LDI r0, 0
    LDI r10, 0
    IOCTL r6, r0, r10
    ; r1 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r8, key_buf
    LDI r2, 1
    READ r9, r8, r2
    ; r1 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r5, 0
    CMP r1, r5
    JZ r1, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r1
    LDI r5, 255
    AND r1, r5       ; r1 = random x (0-255)

    RAND r8
    AND r8, r5       ; r8 = random y (0-255)

    RAND r2
    AND r2, r5       ; r2 = random color component

    ; Make it brighter (add 0x111111)
    LDI r5, 0x111111
    ADD r2, r5

    ; Draw pixel directly
    PSETI r1, r8, r2

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r8, pixel_buf
    LDI r2, 440
    STORE r8, r2
    LDI r2, 1
    ADD r8, r2       ; r8 = pixel_buf + 1
    LDI r2, 50
    STORE r8, r2
    LDI r8, pixel_buf
    LDI r2, 2
    WRITE r4, r8, r2

skip:
    FRAME
    JMP loop
