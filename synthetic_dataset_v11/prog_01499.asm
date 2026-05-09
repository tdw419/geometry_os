; DESCRIPTION: Draws a orange rectangle at (124, 54) with width 22 and height 27.
; PLAN: r0=124(x), r1=54(y), r2=22(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 54
LDI r2, 22
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
