; DESCRIPTION: Composite: . Then Places a white line segment connecting (205, 63) to (166, 253). Then Draws a orange rectangle at (155, 85) with width 60 and height 115.
; PLAN: r0=205(x1), r1=63(y1), r2=166(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=155(x), r1=85(y), r2=60(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (205, 63) to (166, 253).
; PLAN: r0=205(x1), r1=63(y1), r2=166(x2), r3=253(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 63
LDI r2, 166
LDI r3, 253
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a orange rectangle at (155, 85) with width 60 and height 115.
; PLAN: r0=155(x), r1=85(y), r2=60(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 85
LDI r2, 60
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
