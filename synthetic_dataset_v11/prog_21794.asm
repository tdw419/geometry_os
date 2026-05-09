; DESCRIPTION: Draws a orange rectangle at (114, 33) with width 60 and height 120.
; PLAN: r0=114(x), r1=33(y), r2=60(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 33
LDI r2, 60
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
