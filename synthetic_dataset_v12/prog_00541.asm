; DESCRIPTION: Places a yellow line segment connecting (187, 181) to (195, 212).
; PLAN: r0=187(x1), r1=181(y1), r2=195(x2), r3=212(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 181
LDI r2, 195
LDI r3, 212
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
