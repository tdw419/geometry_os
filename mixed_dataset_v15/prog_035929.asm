; DESCRIPTION: Draws a orange rectangle at (196, 77) with width 117 and height 74.
; PLAN: r0=196(x), r1=77(y), r2=117(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 77
LDI r2, 117
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
