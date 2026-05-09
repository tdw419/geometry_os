; DESCRIPTION: Draws a yellow rectangle at (369, 179) with width 57 and height 21.
; PLAN: r0=369(x), r1=179(y), r2=57(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 179
LDI r2, 57
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
