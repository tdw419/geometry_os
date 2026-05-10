; DESCRIPTION: Renders a magenta line between points (325, 141) and (204, 60).
; PLAN: r0=325(x1), r1=141(y1), r2=204(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 141
LDI r2, 204
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
