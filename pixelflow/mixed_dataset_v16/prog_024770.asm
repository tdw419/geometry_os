; DESCRIPTION: Draws a cyan rectangle at (250, 110) with width 54 and height 95.
; PLAN: r0=250(x), r1=110(y), r2=54(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 110
LDI r2, 54
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
