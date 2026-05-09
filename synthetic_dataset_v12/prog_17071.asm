; DESCRIPTION: Renders a black line between points (214, 26) and (91, 214).
; PLAN: r0=214(x1), r1=26(y1), r2=91(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 26
LDI r2, 91
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
