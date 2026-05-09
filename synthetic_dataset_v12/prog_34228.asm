; DESCRIPTION: Draws a magenta line from (407, 68) to (373, 86).
; PLAN: r0=407(x1), r1=68(y1), r2=373(x2), r3=86(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 68
LDI r2, 373
LDI r3, 86
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
