; DESCRIPTION: Renders a black line between points (45, 71) and (150, 162).
; PLAN: r0=45(x1), r1=71(y1), r2=150(x2), r3=162(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 71
LDI r2, 150
LDI r3, 162
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
