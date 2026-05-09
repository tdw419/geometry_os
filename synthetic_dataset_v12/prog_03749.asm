; DESCRIPTION: Draws a cyan rectangle at (302, 105) with width 85 and height 65.
; PLAN: r0=302(x), r1=105(y), r2=85(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 105
LDI r2, 85
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
