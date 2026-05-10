; DESCRIPTION: Renders a red line between points (134, 100) and (394, 91).
; PLAN: r0=134(x1), r1=100(y1), r2=394(x2), r3=91(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 100
LDI r2, 394
LDI r3, 91
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
