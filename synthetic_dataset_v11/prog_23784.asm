; DESCRIPTION: Draws a yellow rectangle at (99, 71) with width 105 and height 48.
; PLAN: r0=99(x), r1=71(y), r2=105(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 71
LDI r2, 105
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
