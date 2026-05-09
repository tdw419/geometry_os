; DESCRIPTION: Renders a green line between points (247, 75) and (79, 44).
; PLAN: r0=247(x1), r1=75(y1), r2=79(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 75
LDI r2, 79
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
