; DESCRIPTION: Places a magenta line segment connecting (427, 152) to (128, 207).
; PLAN: r0=427(x1), r1=152(y1), r2=128(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 152
LDI r2, 128
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
