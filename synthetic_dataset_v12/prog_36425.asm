; DESCRIPTION: Places a white line segment connecting (162, 96) to (408, 36).
; PLAN: r0=162(x1), r1=96(y1), r2=408(x2), r3=36(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 96
LDI r2, 408
LDI r3, 36
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
