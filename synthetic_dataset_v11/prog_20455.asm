; DESCRIPTION: Composite: . Then Renders a orange disk with center (74, 187) and radius 60. Then Places a magenta line segment connecting (170, 125) to (118, 232).
; PLAN: r0=74(x), r1=187(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=170(x1), r1=125(y1), r2=118(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (74, 187) and radius 60.
; PLAN: r0=74(x), r1=187(y), r2=60(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 187
LDI r2, 60
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a magenta line segment connecting (170, 125) to (118, 232).
; PLAN: r0=170(x1), r1=125(y1), r2=118(x2), r3=232(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 125
LDI r2, 118
LDI r3, 232
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
