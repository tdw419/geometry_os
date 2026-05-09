; 046_sine_waves.asm -- Two offset sine waves on dark background
; Wave 1 (cyan): y = 128 - 60*sin(2*pi*x/128), 16px step segments
; Wave 2 (magenta): y = 128 + 60*sin(2*pi*x/128), same steps

; Dark background
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 256
LDI r4, 0x0A0A2E
RECTF r0, r1, r2, r3, r4

; Horizontal center axis (dim gray)
LDI r0, 0
LDI r1, 128
LDI r2, 255
LDI r3, 128
LDI r4, 0x222244
LINE r0, r1, r2, r3, r4

; --- Wave 1: Cyan (0x00FFFF) ---
; y = 128 - round(60*sin(2*pi*x/128))
LDI r4, 0x00FFFF
LDI r0, 0
LDI r1, 128
LDI r2, 16
LDI r3, 86
LINE r0, r1, r2, r3, r4
LDI r0, 16
LDI r1, 86
LDI r2, 32
LDI r3, 68
LINE r0, r1, r2, r3, r4
LDI r0, 32
LDI r1, 68
LDI r2, 48
LDI r3, 86
LINE r0, r1, r2, r3, r4
LDI r0, 48
LDI r1, 86
LDI r2, 64
LDI r3, 128
LINE r0, r1, r2, r3, r4
LDI r0, 64
LDI r1, 128
LDI r2, 80
LDI r3, 170
LINE r0, r1, r2, r3, r4
LDI r0, 80
LDI r1, 170
LDI r2, 96
LDI r3, 188
LINE r0, r1, r2, r3, r4
LDI r0, 96
LDI r1, 188
LDI r2, 112
LDI r3, 170
LINE r0, r1, r2, r3, r4
LDI r0, 112
LDI r1, 170
LDI r2, 128
LDI r3, 128
LINE r0, r1, r2, r3, r4
LDI r0, 128
LDI r1, 128
LDI r2, 144
LDI r3, 86
LINE r0, r1, r2, r3, r4
LDI r0, 144
LDI r1, 86
LDI r2, 160
LDI r3, 68
LINE r0, r1, r2, r3, r4
LDI r0, 160
LDI r1, 68
LDI r2, 176
LDI r3, 86
LINE r0, r1, r2, r3, r4
LDI r0, 176
LDI r1, 86
LDI r2, 192
LDI r3, 128
LINE r0, r1, r2, r3, r4
LDI r0, 192
LDI r1, 128
LDI r2, 208
LDI r3, 170
LINE r0, r1, r2, r3, r4
LDI r0, 208
LDI r1, 170
LDI r2, 224
LDI r3, 188
LINE r0, r1, r2, r3, r4
LDI r0, 224
LDI r1, 188
LDI r2, 240
LDI r3, 170
LINE r0, r1, r2, r3, r4
LDI r0, 240
LDI r1, 170
LDI r2, 255
LDI r3, 128
LINE r0, r1, r2, r3, r4

; --- Wave 2: Magenta (0xFF00FF) ---
; y = 128 + round(60*sin(2*pi*x/128))
LDI r4, 0xFF00FF
LDI r0, 0
LDI r1, 128
LDI r2, 16
LDI r3, 170
LINE r0, r1, r2, r3, r4
LDI r0, 16
LDI r1, 170
LDI r2, 32
LDI r3, 188
LINE r0, r1, r2, r3, r4
LDI r0, 32
LDI r1, 188
LDI r2, 48
LDI r3, 170
LINE r0, r1, r2, r3, r4
LDI r0, 48
LDI r1, 170
LDI r2, 64
LDI r3, 128
LINE r0, r1, r2, r3, r4
LDI r0, 64
LDI r1, 128
LDI r2, 80
LDI r3, 86
LINE r0, r1, r2, r3, r4
LDI r0, 80
LDI r1, 86
LDI r2, 96
LDI r3, 68
LINE r0, r1, r2, r3, r4
LDI r0, 96
LDI r1, 68
LDI r2, 112
LDI r3, 86
LINE r0, r1, r2, r3, r4
LDI r0, 112
LDI r1, 86
LDI r2, 128
LDI r3, 128
LINE r0, r1, r2, r3, r4
LDI r0, 128
LDI r1, 128
LDI r2, 144
LDI r3, 170
LINE r0, r1, r2, r3, r4
LDI r0, 144
LDI r1, 170
LDI r2, 160
LDI r3, 188
LINE r0, r1, r2, r3, r4
LDI r0, 160
LDI r1, 188
LDI r2, 176
LDI r3, 170
LINE r0, r1, r2, r3, r4
LDI r0, 176
LDI r1, 170
LDI r2, 192
LDI r3, 128
LINE r0, r1, r2, r3, r4
LDI r0, 192
LDI r1, 128
LDI r2, 208
LDI r3, 86
LINE r0, r1, r2, r3, r4
LDI r0, 208
LDI r1, 86
LDI r2, 224
LDI r3, 68
LINE r0, r1, r2, r3, r4
LDI r0, 224
LDI r1, 68
LDI r2, 240
LDI r3, 86
LINE r0, r1, r2, r3, r4
LDI r0, 240
LDI r1, 86
LDI r2, 255
LDI r3, 128
LINE r0, r1, r2, r3, r4

HALT
