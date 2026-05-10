; DESCRIPTION: Draws a orange rectangle at (31, 124) with width 27 and height 110.
; PLAN: r0=31(x), r1=124(y), r2=27(width), r3=110(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 124
LDI r2, 27
LDI r3, 110
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
