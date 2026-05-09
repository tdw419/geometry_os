; DESCRIPTION: Draws a orange rectangle at (179, 40) with width 77 and height 112.
; PLAN: r0=179(x), r1=40(y), r2=77(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 40
LDI r2, 77
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
