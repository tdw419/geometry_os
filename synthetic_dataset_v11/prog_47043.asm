; DESCRIPTION: Composite: . Then Renders a white disk with center (161, 200) and radius 45. Then Places a orange line segment connecting (212, 141) to (169, 182).
; PLAN: r0=161(x), r1=200(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=212(x1), r1=141(y1), r2=169(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (161, 200) and radius 45.
; PLAN: r0=161(x), r1=200(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 161
LDI r1, 200
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a orange line segment connecting (212, 141) to (169, 182).
; PLAN: r0=212(x1), r1=141(y1), r2=169(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 141
LDI r2, 169
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
