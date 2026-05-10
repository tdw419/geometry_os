; DESCRIPTION: Draws a cyan rectangle at (143, 144) with width 97 and height 32.
; PLAN: r0=143(x), r1=144(y), r2=97(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 144
LDI r2, 97
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
