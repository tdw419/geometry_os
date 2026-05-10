; DESCRIPTION: Renders a orange line segment connecting (185, 53) to (400, 103).
; PLAN: r0=185(x1), r1=53(y1), r2=400(x2), r3=103(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 53
LDI r2, 400
LDI r3, 103
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
