; DESCRIPTION: Draws a orange rectangle at (22, 194) with width 12 and height 50.
; PLAN: r0=22(x), r1=194(y), r2=12(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 194
LDI r2, 12
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
