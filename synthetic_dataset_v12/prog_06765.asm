; DESCRIPTION: Renders a magenta line between points (119, 31) and (183, 59).
; PLAN: r0=119(x1), r1=31(y1), r2=183(x2), r3=59(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 31
LDI r2, 183
LDI r3, 59
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
