; DESCRIPTION: Draws a magenta line from (194, 160) to (373, 209).
; PLAN: r0=194(x1), r1=160(y1), r2=373(x2), r3=209(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 160
LDI r2, 373
LDI r3, 209
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
