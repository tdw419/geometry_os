; DESCRIPTION: Draws a purple line from (170, 20) to (48, 0).
; PLAN: r0=170(x1), r1=20(y1), r2=48(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 20
LDI r2, 48
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
