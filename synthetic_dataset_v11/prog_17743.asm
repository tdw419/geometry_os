; DESCRIPTION: Draws a magenta line from (222, 251) to (154, 109).
; PLAN: r0=222(x1), r1=251(y1), r2=154(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 251
LDI r2, 154
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
