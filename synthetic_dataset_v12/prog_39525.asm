; DESCRIPTION: Renders a red line between points (45, 144) and (280, 2).
; PLAN: r0=45(x1), r1=144(y1), r2=280(x2), r3=2(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 144
LDI r2, 280
LDI r3, 2
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
