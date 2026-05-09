; DESCRIPTION: Renders a red line between points (286, 150) and (66, 150).
; PLAN: r0=286(x1), r1=150(y1), r2=66(x2), r3=150(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 150
LDI r2, 66
LDI r3, 150
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
