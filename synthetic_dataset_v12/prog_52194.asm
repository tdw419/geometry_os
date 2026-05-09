; DESCRIPTION: Renders a magenta line between points (103, 175) and (311, 250).
; PLAN: r0=103(x1), r1=175(y1), r2=311(x2), r3=250(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 175
LDI r2, 311
LDI r3, 250
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
