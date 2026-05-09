; DESCRIPTION: Renders a magenta line between points (6, 234) and (368, 104).
; PLAN: r0=6(x1), r1=234(y1), r2=368(x2), r3=104(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 234
LDI r2, 368
LDI r3, 104
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
