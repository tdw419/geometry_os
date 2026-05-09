; DESCRIPTION: Places a white line segment connecting (408, 110) to (151, 222).
; PLAN: r0=408(x1), r1=110(y1), r2=151(x2), r3=222(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 110
LDI r2, 151
LDI r3, 222
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
