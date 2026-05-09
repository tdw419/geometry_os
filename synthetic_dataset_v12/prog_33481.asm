; DESCRIPTION: Draws a orange rectangle at (369, 104) with width 27 and height 52.
; PLAN: r0=369(x), r1=104(y), r2=27(width), r3=52(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 104
LDI r2, 27
LDI r3, 52
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
