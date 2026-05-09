; DESCRIPTION: Places a yellow line segment connecting (79, 223) to (128, 202).
; PLAN: r0=79(x1), r1=223(y1), r2=128(x2), r3=202(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 223
LDI r2, 128
LDI r3, 202
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
