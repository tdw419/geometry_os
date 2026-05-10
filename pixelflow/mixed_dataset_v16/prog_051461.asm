; DESCRIPTION: Renders a magenta line between points (341, 214) and (211, 162).
; PLAN: r0=341(x1), r1=214(y1), r2=211(x2), r3=162(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 214
LDI r2, 211
LDI r3, 162
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
