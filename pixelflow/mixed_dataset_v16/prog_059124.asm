; DESCRIPTION: Renders a purple line between points (285, 42) and (299, 145).
; PLAN: r0=285(x1), r1=42(y1), r2=299(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 42
LDI r2, 299
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
