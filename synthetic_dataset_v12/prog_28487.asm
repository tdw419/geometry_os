; DESCRIPTION: Places a yellow line segment connecting (371, 233) to (84, 186).
; PLAN: r0=371(x1), r1=233(y1), r2=84(x2), r3=186(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 233
LDI r2, 84
LDI r3, 186
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
