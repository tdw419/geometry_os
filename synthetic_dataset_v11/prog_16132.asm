; DESCRIPTION: Places a purple line segment connecting (187, 152) to (102, 64).
; PLAN: r0=187(x1), r1=152(y1), r2=102(x2), r3=64(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 152
LDI r2, 102
LDI r3, 64
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
