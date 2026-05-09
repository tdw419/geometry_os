; DESCRIPTION: Renders a black line between points (308, 96) and (290, 112).
; PLAN: r0=308(x1), r1=96(y1), r2=290(x2), r3=112(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 96
LDI r2, 290
LDI r3, 112
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
