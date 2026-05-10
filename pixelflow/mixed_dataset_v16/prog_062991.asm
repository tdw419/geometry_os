; DESCRIPTION: Renders a red line between points (64, 91) and (79, 170).
; PLAN: r0=64(x1), r1=91(y1), r2=79(x2), r3=170(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 91
LDI r2, 79
LDI r3, 170
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
