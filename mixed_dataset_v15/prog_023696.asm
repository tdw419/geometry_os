; DESCRIPTION: Renders a magenta line between points (290, 49) and (311, 174).
; PLAN: r0=290(x1), r1=49(y1), r2=311(x2), r3=174(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 49
LDI r2, 311
LDI r3, 174
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
