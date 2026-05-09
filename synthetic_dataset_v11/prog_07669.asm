; DESCRIPTION: Composite: . Then Renders a orange line between points (61, 201) and (148, 145). Then Draws a red rectangle at (156, 130) with width 41 and height 53.
; PLAN: r0=61(x1), r1=201(y1), r2=148(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=156(x), r1=130(y), r2=41(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange line between points (61, 201) and (148, 145).
; PLAN: r0=61(x1), r1=201(y1), r2=148(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 201
LDI r2, 148
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a red rectangle at (156, 130) with width 41 and height 53.
; PLAN: r0=156(x), r1=130(y), r2=41(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 130
LDI r2, 41
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
