; DESCRIPTION: Draws a blue line from (289, 73) to (193, 198).
; PLAN: r0=289(x1), r1=73(y1), r2=193(x2), r3=198(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 73
LDI r2, 193
LDI r3, 198
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
