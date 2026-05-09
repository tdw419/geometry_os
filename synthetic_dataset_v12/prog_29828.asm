; DESCRIPTION: Renders a purple line between points (218, 0) and (180, 32).
; PLAN: r0=218(x1), r1=0(y1), r2=180(x2), r3=32(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 0
LDI r2, 180
LDI r3, 32
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
