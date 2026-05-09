; DESCRIPTION: Draws a cyan rectangle at (62, 110) with width 65 and height 32.
; PLAN: r0=62(x), r1=110(y), r2=65(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 110
LDI r2, 65
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
