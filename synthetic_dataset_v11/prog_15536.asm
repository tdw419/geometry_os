; DESCRIPTION: Renders a magenta line between points (150, 225) and (75, 4).
; PLAN: r0=150(x1), r1=225(y1), r2=75(x2), r3=4(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 225
LDI r2, 75
LDI r3, 4
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
