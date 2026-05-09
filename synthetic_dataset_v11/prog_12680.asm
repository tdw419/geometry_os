; DESCRIPTION: Composite: . Then Places a red line segment connecting (152, 76) to (69, 158). Then Renders a orange disk with center (66, 134) and radius 13.
; PLAN: r0=152(x1), r1=76(y1), r2=69(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=66(x), r1=134(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a red line segment connecting (152, 76) to (69, 158).
; PLAN: r0=152(x1), r1=76(y1), r2=69(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 76
LDI r2, 69
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (66, 134) and radius 13.
; PLAN: r0=66(x), r1=134(y), r2=13(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 66
LDI r1, 134
LDI r2, 13
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
