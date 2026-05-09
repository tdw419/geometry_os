; DESCRIPTION: Draws a purple line from (15, 238) to (294, 48).
; PLAN: r0=15(x1), r1=238(y1), r2=294(x2), r3=48(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 238
LDI r2, 294
LDI r3, 48
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
