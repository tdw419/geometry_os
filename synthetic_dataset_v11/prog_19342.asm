; DESCRIPTION: Places a blue line segment connecting (32, 107) to (38, 26).
; PLAN: r0=32(x1), r1=107(y1), r2=38(x2), r3=26(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 107
LDI r2, 38
LDI r3, 26
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
