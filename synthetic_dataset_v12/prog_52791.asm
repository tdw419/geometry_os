; DESCRIPTION: Draws a yellow rectangle at (331, 117) with width 29 and height 96.
; PLAN: r0=331(x), r1=117(y), r2=29(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 117
LDI r2, 29
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
