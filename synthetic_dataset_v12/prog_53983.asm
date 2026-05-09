; DESCRIPTION: Draws a black rectangle at (7, 124) with width 78 and height 85.
; PLAN: r0=7(x), r1=124(y), r2=78(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 124
LDI r2, 78
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
