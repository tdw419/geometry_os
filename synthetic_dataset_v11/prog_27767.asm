; DESCRIPTION: Renders a magenta line between points (204, 198) and (215, 47).
; PLAN: r0=204(x1), r1=198(y1), r2=215(x2), r3=47(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 198
LDI r2, 215
LDI r3, 47
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
