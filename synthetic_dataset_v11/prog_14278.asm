; DESCRIPTION: Draws a orange rectangle at (71, 185) with width 60 and height 13.
; PLAN: r0=71(x), r1=185(y), r2=60(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 185
LDI r2, 60
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
