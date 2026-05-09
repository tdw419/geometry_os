; DESCRIPTION: Places a magenta line segment connecting (331, 10) to (17, 16).
; PLAN: r0=331(x1), r1=10(y1), r2=17(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 10
LDI r2, 17
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
