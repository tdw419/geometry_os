; DESCRIPTION: Draws a black rectangle at (78, 161) with width 106 and height 50.
; PLAN: r0=78(x), r1=161(y), r2=106(width), r3=50(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 161
LDI r2, 106
LDI r3, 50
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
