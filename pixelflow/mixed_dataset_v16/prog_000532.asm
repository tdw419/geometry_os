; DESCRIPTION: Renders a magenta line between points (33, 250) and (334, 183).
; PLAN: r0=33(x1), r1=250(y1), r2=334(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 250
LDI r2, 334
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
