; DESCRIPTION: Places a blue line segment connecting (349, 36) to (365, 188).
; PLAN: r0=349(x1), r1=36(y1), r2=365(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 36
LDI r2, 365
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
