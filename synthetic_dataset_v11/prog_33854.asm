; DESCRIPTION: Renders a white line between points (37, 185) and (91, 200).
; PLAN: r0=37(x1), r1=185(y1), r2=91(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 185
LDI r2, 91
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
