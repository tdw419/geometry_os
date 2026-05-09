; DESCRIPTION: Draws a yellow rectangle at (27, 222) with width 109 and height 25.
; PLAN: r0=27(x), r1=222(y), r2=109(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 222
LDI r2, 109
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
