; DESCRIPTION: Places a blue line segment connecting (104, 66) to (187, 162).
; PLAN: r0=104(x1), r1=66(y1), r2=187(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 66
LDI r2, 187
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
