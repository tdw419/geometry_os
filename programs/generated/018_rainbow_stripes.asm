; RAINBOW STRIPES -- 8 horizontal color stripes filling the screen
; Each stripe is 32 pixels tall (256 / 8 = 32)

; Red stripe (y=0)
LDI r0, 0
LDI r1, 0
LDI r2, 256
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4

; Orange stripe (y=32)
LDI r1, 32
LDI r4, 0xFF8000
RECTF r0, r1, r2, r3, r4

; Yellow stripe (y=64)
LDI r1, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4

; Green stripe (y=96)
LDI r1, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4

; Cyan stripe (y=128)
LDI r1, 128
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4

; Blue stripe (y=160)
LDI r1, 160
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4

; Violet stripe (y=192)
LDI r1, 192
LDI r4, 0x8000FF
RECTF r0, r1, r2, r3, r4

; Magenta stripe (y=224)
LDI r1, 224
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4

HALT
