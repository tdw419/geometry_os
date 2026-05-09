; DESCRIPTION: Renders a magenta line between points (453, 164) and (312, 2).
; PLAN: r0=453(x1), r1=164(y1), r2=312(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 164
LDI r2, 312
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
