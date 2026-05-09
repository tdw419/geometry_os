; DESCRIPTION: Draws a purple line from (131, 16) to (215, 219).
; PLAN: r0=131(x1), r1=16(y1), r2=215(x2), r3=219(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 16
LDI r2, 215
LDI r3, 219
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
