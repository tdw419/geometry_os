; DESCRIPTION: Draws a purple line from (32, 21) to (355, 225).
; PLAN: r0=32(x1), r1=21(y1), r2=355(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 21
LDI r2, 355
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
