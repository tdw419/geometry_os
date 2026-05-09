; DESCRIPTION: Renders a white line between points (209, 91) and (201, 150).
; PLAN: r0=209(x1), r1=91(y1), r2=201(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 91
LDI r2, 201
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
