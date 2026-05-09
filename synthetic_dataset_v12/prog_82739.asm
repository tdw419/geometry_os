; DESCRIPTION: Draws a purple line from (487, 218) to (327, 219).
; PLAN: r0=487(x1), r1=218(y1), r2=327(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 218
LDI r2, 327
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
