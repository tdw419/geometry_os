; DESCRIPTION: Renders a purple line between points (81, 54) and (365, 30).
; PLAN: r0=81(x1), r1=54(y1), r2=365(x2), r3=30(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 54
LDI r2, 365
LDI r3, 30
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
