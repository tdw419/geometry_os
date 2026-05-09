; DESCRIPTION: Renders a green line between points (94, 93) and (493, 116).
; PLAN: r0=94(x1), r1=93(y1), r2=493(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 93
LDI r2, 493
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
