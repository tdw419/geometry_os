; DESCRIPTION: Places a blue line segment connecting (335, 97) to (215, 214).
; PLAN: r0=335(x1), r1=97(y1), r2=215(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 97
LDI r2, 215
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
