; DESCRIPTION: Draws a magenta line from (112, 21) to (264, 60).
; PLAN: r0=112(x1), r1=21(y1), r2=264(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 21
LDI r2, 264
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
