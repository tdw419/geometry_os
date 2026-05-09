; DESCRIPTION: Places a yellow line segment connecting (143, 162) to (20, 28).
; PLAN: r0=143(x1), r1=162(y1), r2=20(x2), r3=28(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 162
LDI r2, 20
LDI r3, 28
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
