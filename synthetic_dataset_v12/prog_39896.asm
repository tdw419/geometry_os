; DESCRIPTION: Draws a magenta line from (21, 155) to (264, 12).
; PLAN: r0=21(x1), r1=155(y1), r2=264(x2), r3=12(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 155
LDI r2, 264
LDI r3, 12
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
