; DESCRIPTION: Draws a blue line from (94, 229) to (466, 214).
; PLAN: r0=94(x1), r1=229(y1), r2=466(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 229
LDI r2, 466
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
