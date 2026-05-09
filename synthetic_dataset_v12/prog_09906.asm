; DESCRIPTION: Draws a white rectangle at (110, 172) with width 27 and height 38.
; PLAN: r0=110(x), r1=172(y), r2=27(width), r3=38(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 172
LDI r2, 27
LDI r3, 38
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
