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
    LDI r4, 0x000033
    FILL r4

    ; Draw title bar
    LDI r13, 0
    LDI r3, 0
    LDI r5, 256
    LDI r11, 16
    LDI r4, 0x003366
    RECTF r13, r3, r5, r11, r4

    ; Draw status bar at bottom
    LDI r13, 0
    LDI r3, 240
    LDI r5, 256
    LDI r11, 16
    LDI r4, 0x003366
    RECTF r13, r3, r5, r11, r4

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r13, screen_path
    LDI r3, 0
    OPEN r13, r3
    ; r1 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r13, kb_path
    LDI r3, 0
    OPEN r13, r3
    ; r1 = 0xE001 (keyboard fd), save to r15
    MOV r15, r1

    ; /dev/audio -> fd 0xE002
    LDI r13, audio_path
    LDI r3, 0
    OPEN r13, r3
    ; r1 = 0xE002 (audio fd), save to r14
    MOV r14, r1

    ; /dev/net -> fd 0xE003
    LDI r13, net_path
    LDI r3, 0
    OPEN r13, r3
    ; r1 = 0xE003 (net fd), save to r0
    MOV r0, r1

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r6, 0xE000
    LDI r12, 0
    LDI r9, 0
    IOCTL r6, r12, r9
    ; r1 = 256 (width), store it
    LDI r20, result
    STORE r20, r1

    ; Get screen height (cmd=1) -- should return 256
    LDI r6, 0xE000
    LDI r12, 1
    LDI r9, 0
    IOCTL r6, r12, r9
    ; r1 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r6, 0xE001
    LDI r12, 1
    LDI r9, 1
    IOCTL r6, r12, r9
    ; r1 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r6, 0xE002
    LDI r12, 1
    LDI r9, 50
    IOCTL r6, r12, r9
    ; r1 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r6, 0xE003
    LDI r12, 0
    LDI r9, 0
    IOCTL r6, r12, r9
    ; r1 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r13, key_buf
    LDI r3, 1
    READ r15, r13, r3
    ; r1 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r5, 0
    CMP r1, r5
    JZ r1, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r1
    LDI r5, 255
    AND r1, r5       ; r1 = random x (0-255)

    RAND r13
    AND r13, r5       ; r13 = random y (0-255)

    RAND r3
    AND r3, r5       ; r3 = random color component

    ; Make it brighter (add 0x111111)
    LDI r5, 0x111111
    ADD r3, r5

    ; Draw pixel directly
    PSETI r1, r13, r3

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r13, pixel_buf
    LDI r3, 440
    STORE r13, r3
    LDI r3, 1
    ADD r13, r3       ; r13 = pixel_buf + 1
    LDI r3, 50
    STORE r13, r3
    LDI r13, pixel_buf
    LDI r3, 2
    WRITE r14, r13, r3

skip:
    FRAME
    JMP loop
