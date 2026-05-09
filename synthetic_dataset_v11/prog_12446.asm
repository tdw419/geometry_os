; DESCRIPTION: Draws a orange rectangle at (24, 160) with width 37 and height 77.
; PLAN: r0=24(x), r1=160(y), r2=37(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 160
LDI r2, 37
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
