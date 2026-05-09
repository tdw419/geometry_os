; DESCRIPTION: Draws a yellow rectangle at (201, 240) with width 27 and height 14.
; PLAN: r0=201(x), r1=240(y), r2=27(width), r3=14(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 240
LDI r2, 27
LDI r3, 14
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
