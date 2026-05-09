; DESCRIPTION: Draws a black rectangle at (7, 33) with width 66 and height 71.
; PLAN: r0=7(x), r1=33(y), r2=66(width), r3=71(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 33
LDI r2, 66
LDI r3, 71
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
