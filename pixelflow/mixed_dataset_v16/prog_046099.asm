; DESCRIPTION: Draws a yellow rectangle at (48, 174) with width 13 and height 36.
; PLAN: r0=48(x), r1=174(y), r2=13(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 174
LDI r2, 13
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
