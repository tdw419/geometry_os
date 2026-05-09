; DESCRIPTION: Renders a magenta line between points (381, 207) and (119, 146).
; PLAN: r0=381(x1), r1=207(y1), r2=119(x2), r3=146(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 207
LDI r2, 119
LDI r3, 146
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
