; DESCRIPTION: Draws a colored object at the screen with fixed size.

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
    LDI r14, 0x000033
    FILL r14

    ; Draw title bar
    LDI r11, 0
    LDI r6, 0
    LDI r4, 256
    LDI r5, 16
    LDI r14, 0x003366
    RECTF r11, r6, r4, r5, r14

    ; Draw status bar at bottom
    LDI r11, 0
    LDI r6, 240
    LDI r4, 256
    LDI r5, 16
    LDI r14, 0x003366
    RECTF r11, r6, r4, r5, r14

    ; === Test 1: Open all 4 devices ===
    ; /dev/screen -> fd 0xE000
    LDI r11, screen_path
    LDI r6, 0
    OPEN r11, r6
    ; r8 = 0xE000 (screen fd)

    ; /dev/keyboard -> fd 0xE001
    LDI r11, kb_path
    LDI r6, 0
    OPEN r11, r6
    ; r8 = 0xE001 (keyboard fd), save to r2
    MOV r2, r8

    ; /dev/audio -> fd 0xE002
    LDI r11, audio_path
    LDI r6, 0
    OPEN r11, r6
    ; r8 = 0xE002 (audio fd), save to r10
    MOV r10, r8

    ; /dev/net -> fd 0xE003
    LDI r11, net_path
    LDI r6, 0
    OPEN r11, r6
    ; r8 = 0xE003 (net fd), save to r1
    MOV r1, r8

    ; === Test 2: IOCTL queries ===
    ; Get screen width (cmd=0) -- should return 256
    LDI r15, 0xE000
    LDI r12, 0
    LDI r7, 0
    IOCTL r15, r12, r7
    ; r8 = 256 (width), store it
    LDI r20, result
    STORE r20, r8

    ; Get screen height (cmd=1) -- should return 256
    LDI r15, 0xE000
    LDI r12, 1
    LDI r7, 0
    IOCTL r15, r12, r7
    ; r8 = 256 (height)

    ; Set keyboard echo mode to 1 (cmd=1)
    LDI r15, 0xE001
    LDI r12, 1
    LDI r7, 1
    IOCTL r15, r12, r7
    ; r8 = 0 (success)

    ; Set audio volume to 50 (cmd=1)
    LDI r15, 0xE002
    LDI r12, 1
    LDI r7, 50
    IOCTL r15, r12, r7
    ; r8 = 0 (success)

    ; Get net status (cmd=0) -- should return 1 (up)
    LDI r15, 0xE003
    LDI r12, 0
    LDI r7, 0
    IOCTL r15, r12, r7
    ; r8 = 1 (net up)

    ; === Test 3: Interactive loop ===
    ; Read keyboard, draw random colored pixels
loop:
    ; Read one key from /dev/keyboard
    LDI r11, key_buf
    LDI r6, 1
    READ r2, r11, r6
    ; r8 = bytes read (1 if key pressed, 0 if not)

    ; If no key, just frame and loop
    LDI r4, 0
    CMP r8, r4
    JZ r8, skip

    ; Key was pressed -- generate random pixel position and color
    RAND r8
    LDI r4, 255
    AND r8, r4       ; r8 = random x (0-255)

    RAND r11
    AND r11, r4       ; r11 = random y (0-255)

    RAND r6
    AND r6, r4       ; r6 = random color component

    ; Make it brighter (add 0x111111)
    LDI r4, 0x111111
    ADD r6, r4

    ; Draw pixel directly
    PSETI r8, r11, r6

    ; Also beep on keypress (via /dev/audio write)
    ; Write (freq=440, dur=50) to audio device
    LDI r11, pixel_buf
    LDI r6, 440
    STORE r11, r6
    LDI r6, 1
    ADD r11, r6       ; r11 = pixel_buf + 1
    LDI r6, 50
    STORE r11, r6
    LDI r11, pixel_buf
    LDI r6, 2
    WRITE r10, r11, r6

skip:
    FRAME
    JMP loop
