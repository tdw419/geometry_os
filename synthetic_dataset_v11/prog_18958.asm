; DESCRIPTION: Draws a cyan rectangle at (97, 32) with width 21 and height 12.
; PLAN: r0=97(x), r1=32(y), r2=21(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 32
LDI r2, 21
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
