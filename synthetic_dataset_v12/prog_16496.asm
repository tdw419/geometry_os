; DESCRIPTION: Places a blue line segment connecting (447, 231) to (284, 90).
; PLAN: r0=447(x1), r1=231(y1), r2=284(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 231
LDI r2, 284
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
