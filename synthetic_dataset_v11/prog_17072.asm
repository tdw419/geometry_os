; DESCRIPTION: Renders a magenta line between points (116, 78) and (76, 193).
; PLAN: r0=116(x1), r1=78(y1), r2=76(x2), r3=193(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 78
LDI r2, 76
LDI r3, 193
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
