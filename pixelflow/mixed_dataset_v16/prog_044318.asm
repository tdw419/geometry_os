; DESCRIPTION: Draws a orange rectangle at (245, 80) with width 81 and height 117.
; PLAN: r0=245(x), r1=80(y), r2=81(width), r3=117(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 80
LDI r2, 81
LDI r3, 117
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
