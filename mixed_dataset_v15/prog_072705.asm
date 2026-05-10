; DESCRIPTION: Renders a purple line between points (360, 214) and (27, 31).
; PLAN: r0=360(x1), r1=214(y1), r2=27(x2), r3=31(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 214
LDI r2, 27
LDI r3, 31
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
