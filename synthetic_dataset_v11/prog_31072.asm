; DESCRIPTION: Places a white line segment connecting (73, 16) to (0, 162).
; PLAN: r0=73(x1), r1=16(y1), r2=0(x2), r3=162(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 16
LDI r2, 0
LDI r3, 162
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
