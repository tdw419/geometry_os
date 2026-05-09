; DESCRIPTION: Places a magenta line segment connecting (86, 27) to (195, 7).
; PLAN: r0=86(x1), r1=27(y1), r2=195(x2), r3=7(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 27
LDI r2, 195
LDI r3, 7
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
