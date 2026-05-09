; DESCRIPTION: Draws a blue line from (358, 120) to (433, 230).
; PLAN: r0=358(x1), r1=120(y1), r2=433(x2), r3=230(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 120
LDI r2, 433
LDI r3, 230
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
