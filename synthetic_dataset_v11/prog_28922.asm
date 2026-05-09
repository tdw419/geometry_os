; DESCRIPTION: Renders a purple line between points (36, 74) and (50, 127).
; PLAN: r0=36(x1), r1=74(y1), r2=50(x2), r3=127(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 74
LDI r2, 50
LDI r3, 127
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
