; DESCRIPTION: Renders a magenta line between points (296, 4) and (123, 142).
; PLAN: r0=296(x1), r1=4(y1), r2=123(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 4
LDI r2, 123
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
