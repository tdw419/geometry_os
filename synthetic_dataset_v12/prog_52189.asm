; DESCRIPTION: Draws a magenta line from (172, 47) to (62, 2).
; PLAN: r0=172(x1), r1=47(y1), r2=62(x2), r3=2(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 47
LDI r2, 62
LDI r3, 2
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
