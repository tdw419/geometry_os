; DESCRIPTION: Renders a orange line segment connecting (150, 177) to (293, 198).
; PLAN: r0=150(x1), r1=177(y1), r2=293(x2), r3=198(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 177
LDI r2, 293
LDI r3, 198
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
