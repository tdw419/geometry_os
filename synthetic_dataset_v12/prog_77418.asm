; DESCRIPTION: Renders a magenta line between points (227, 94) and (33, 103).
; PLAN: r0=227(x1), r1=94(y1), r2=33(x2), r3=103(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 94
LDI r2, 33
LDI r3, 103
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
