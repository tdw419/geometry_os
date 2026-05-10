; DESCRIPTION: Renders a magenta line between points (278, 134) and (367, 251).
; PLAN: r0=278(x1), r1=134(y1), r2=367(x2), r3=251(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 134
LDI r2, 367
LDI r3, 251
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
