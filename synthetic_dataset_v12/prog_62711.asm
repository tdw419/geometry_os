; DESCRIPTION: Renders a magenta line between points (374, 105) and (294, 90).
; PLAN: r0=374(x1), r1=105(y1), r2=294(x2), r3=90(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 105
LDI r2, 294
LDI r3, 90
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
