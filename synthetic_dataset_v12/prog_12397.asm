; DESCRIPTION: Places a blue line segment connecting (242, 4) to (459, 13).
; PLAN: r0=242(x1), r1=4(y1), r2=459(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 4
LDI r2, 459
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
