; DESCRIPTION: Renders a blue line between points (220, 190) and (126, 22).
; PLAN: r0=220(x1), r1=190(y1), r2=126(x2), r3=22(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 190
LDI r2, 126
LDI r3, 22
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
