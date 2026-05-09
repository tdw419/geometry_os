; DESCRIPTION: Places a magenta line segment connecting (276, 253) to (91, 9).
; PLAN: r0=276(x1), r1=253(y1), r2=91(x2), r3=9(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 253
LDI r2, 91
LDI r3, 9
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
