; DESCRIPTION: Renders a magenta line between points (240, 232) and (83, 207).
; PLAN: r0=240(x1), r1=232(y1), r2=83(x2), r3=207(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 232
LDI r2, 83
LDI r3, 207
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
