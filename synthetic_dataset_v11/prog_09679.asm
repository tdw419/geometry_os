; DESCRIPTION: Composite: . Then Draws a magenta line from (67, 172) to (157, 67). Then Places a orange circle of radius 24 at center (159, 91).
; PLAN: r0=67(x1), r1=172(y1), r2=157(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=159(x), r1=91(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a magenta line from (67, 172) to (157, 67).
; PLAN: r0=67(x1), r1=172(y1), r2=157(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 172
LDI r2, 157
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a orange circle of radius 24 at center (159, 91).
; PLAN: r0=159(x), r1=91(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 159
LDI r1, 91
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
