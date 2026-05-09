; DESCRIPTION: Places a magenta line segment connecting (259, 42) to (275, 17).
; PLAN: r0=259(x1), r1=42(y1), r2=275(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 42
LDI r2, 275
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
