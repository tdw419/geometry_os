; DESCRIPTION: Renders a purple line between points (459, 93) and (305, 73).
; PLAN: r0=459(x1), r1=93(y1), r2=305(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 93
LDI r2, 305
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
