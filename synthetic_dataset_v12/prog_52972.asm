; DESCRIPTION: Renders a magenta line between points (45, 191) and (430, 76).
; PLAN: r0=45(x1), r1=191(y1), r2=430(x2), r3=76(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 191
LDI r2, 430
LDI r3, 76
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
