; DESCRIPTION: Renders a purple line between points (330, 204) and (130, 63).
; PLAN: r0=330(x1), r1=204(y1), r2=130(x2), r3=63(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 204
LDI r2, 130
LDI r3, 63
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
