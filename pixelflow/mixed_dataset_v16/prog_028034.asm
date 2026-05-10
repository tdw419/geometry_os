; DESCRIPTION: Places a magenta line segment connecting (229, 18) to (166, 173).
; PLAN: r0=229(x1), r1=18(y1), r2=166(x2), r3=173(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 18
LDI r2, 166
LDI r3, 173
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
