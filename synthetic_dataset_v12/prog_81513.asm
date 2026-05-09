; DESCRIPTION: Draws a blue line from (508, 218) to (299, 224).
; PLAN: r0=508(x1), r1=218(y1), r2=299(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 508
LDI r1, 218
LDI r2, 299
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
