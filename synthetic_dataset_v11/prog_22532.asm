; DESCRIPTION: Draws a purple line from (108, 160) to (237, 177).
; PLAN: r0=108(x1), r1=160(y1), r2=237(x2), r3=177(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 160
LDI r2, 237
LDI r3, 177
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
