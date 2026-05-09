; DESCRIPTION: Places a yellow line segment connecting (486, 152) to (381, 56).
; PLAN: r0=486(x1), r1=152(y1), r2=381(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 152
LDI r2, 381
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
