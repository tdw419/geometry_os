; DESCRIPTION: Renders a red line between points (250, 1) and (27, 71).
; PLAN: r0=250(x1), r1=1(y1), r2=27(x2), r3=71(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 1
LDI r2, 27
LDI r3, 71
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
