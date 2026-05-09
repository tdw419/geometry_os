; DESCRIPTION: Renders a magenta line between points (290, 30) and (107, 251).
; PLAN: r0=290(x1), r1=30(y1), r2=107(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 30
LDI r2, 107
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
