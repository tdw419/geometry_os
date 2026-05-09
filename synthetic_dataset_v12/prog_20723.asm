; DESCRIPTION: Draws a purple line from (340, 131) to (358, 93).
; PLAN: r0=340(x1), r1=131(y1), r2=358(x2), r3=93(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 131
LDI r2, 358
LDI r3, 93
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
