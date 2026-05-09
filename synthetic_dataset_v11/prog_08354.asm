; DESCRIPTION: Places a magenta line segment connecting (178, 253) to (72, 68).
; PLAN: r0=178(x1), r1=253(y1), r2=72(x2), r3=68(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 253
LDI r2, 72
LDI r3, 68
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
