; DESCRIPTION: Draws a orange rectangle at (36, 0) with width 109 and height 91.
; PLAN: r0=36(x), r1=0(y), r2=109(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 0
LDI r2, 109
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
