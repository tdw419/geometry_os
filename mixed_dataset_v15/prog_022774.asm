; DESCRIPTION: Renders a magenta line between points (374, 205) and (88, 66).
; PLAN: r0=374(x1), r1=205(y1), r2=88(x2), r3=66(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 205
LDI r2, 88
LDI r3, 66
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
