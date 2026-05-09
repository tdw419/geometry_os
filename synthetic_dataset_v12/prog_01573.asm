; DESCRIPTION: Places a yellow line segment connecting (132, 107) to (381, 70).
; PLAN: r0=132(x1), r1=107(y1), r2=381(x2), r3=70(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 107
LDI r2, 381
LDI r3, 70
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
