; DESCRIPTION: Renders a purple line between points (357, 98) and (398, 76).
; PLAN: r0=357(x1), r1=98(y1), r2=398(x2), r3=76(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 98
LDI r2, 398
LDI r3, 76
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
