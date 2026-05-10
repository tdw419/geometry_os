; DESCRIPTION: Places a purple line segment connecting (335, 231) to (446, 208).
; PLAN: r0=335(x1), r1=231(y1), r2=446(x2), r3=208(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 231
LDI r2, 446
LDI r3, 208
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
