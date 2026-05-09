; DESCRIPTION: Renders a magenta line between points (198, 131) and (253, 13).
; PLAN: r0=198(x1), r1=131(y1), r2=253(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 131
LDI r2, 253
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
