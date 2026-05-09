; DESCRIPTION: Draws a blue line from (256, 179) to (327, 160).
; PLAN: r0=256(x1), r1=179(y1), r2=327(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 179
LDI r2, 327
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
