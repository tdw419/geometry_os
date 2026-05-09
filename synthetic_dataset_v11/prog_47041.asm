; DESCRIPTION: Draws a magenta line from (106, 129) to (76, 140).
; PLAN: r0=106(x1), r1=129(y1), r2=76(x2), r3=140(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 129
LDI r2, 76
LDI r3, 140
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
