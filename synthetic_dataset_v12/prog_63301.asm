; DESCRIPTION: Places a magenta line segment connecting (321, 210) to (13, 181).
; PLAN: r0=321(x1), r1=210(y1), r2=13(x2), r3=181(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 210
LDI r2, 13
LDI r3, 181
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
