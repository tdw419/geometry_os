; DESCRIPTION: Renders a magenta line between points (174, 63) and (153, 34).
; PLAN: r0=174(x1), r1=63(y1), r2=153(x2), r3=34(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 63
LDI r2, 153
LDI r3, 34
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
