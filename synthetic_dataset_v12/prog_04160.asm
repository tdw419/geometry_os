; DESCRIPTION: Draws a black rectangle at (2, 180) with width 117 and height 22.
; PLAN: r0=2(x), r1=180(y), r2=117(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 180
LDI r2, 117
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
