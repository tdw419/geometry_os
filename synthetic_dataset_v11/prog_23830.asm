; DESCRIPTION: Places a purple line segment connecting (218, 197) to (117, 59).
; PLAN: r0=218(x1), r1=197(y1), r2=117(x2), r3=59(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 197
LDI r2, 117
LDI r3, 59
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
