; DESCRIPTION: Places a magenta line segment connecting (9, 13) to (181, 173).
; PLAN: r0=9(x1), r1=13(y1), r2=181(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 13
LDI r2, 181
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
