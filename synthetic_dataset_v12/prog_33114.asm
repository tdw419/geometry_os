; DESCRIPTION: Places a blue line segment connecting (173, 50) to (333, 207).
; PLAN: r0=173(x1), r1=50(y1), r2=333(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 50
LDI r2, 333
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
