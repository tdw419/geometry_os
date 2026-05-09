; DESCRIPTION: Renders a purple line between points (285, 68) and (32, 21).
; PLAN: r0=285(x1), r1=68(y1), r2=32(x2), r3=21(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 68
LDI r2, 32
LDI r3, 21
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
