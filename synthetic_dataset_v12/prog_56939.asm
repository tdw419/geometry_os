; DESCRIPTION: Draws a black rectangle at (161, 40) with width 47 and height 85.
; PLAN: r0=161(x), r1=40(y), r2=47(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 40
LDI r2, 47
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
