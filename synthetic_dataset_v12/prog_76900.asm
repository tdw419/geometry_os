; DESCRIPTION: Renders a blue line between points (182, 89) and (340, 70).
; PLAN: r0=182(x1), r1=89(y1), r2=340(x2), r3=70(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 89
LDI r2, 340
LDI r3, 70
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
