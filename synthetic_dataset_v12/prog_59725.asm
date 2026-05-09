; DESCRIPTION: Places a green line segment connecting (181, 95) to (350, 194).
; PLAN: r0=181(x1), r1=95(y1), r2=350(x2), r3=194(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 95
LDI r2, 350
LDI r3, 194
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
