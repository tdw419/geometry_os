; DESCRIPTION: Places a magenta line segment connecting (328, 219) to (319, 13).
; PLAN: r0=328(x1), r1=219(y1), r2=319(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 219
LDI r2, 319
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
