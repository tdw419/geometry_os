; DESCRIPTION: Draws a orange rectangle at (186, 11) with width 80 and height 112.
; PLAN: r0=186(x), r1=11(y), r2=80(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 11
LDI r2, 80
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
