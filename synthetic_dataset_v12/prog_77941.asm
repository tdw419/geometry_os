; DESCRIPTION: Renders a purple line between points (178, 64) and (243, 180).
; PLAN: r0=178(x1), r1=64(y1), r2=243(x2), r3=180(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 64
LDI r2, 243
LDI r3, 180
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
