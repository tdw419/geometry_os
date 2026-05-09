; DESCRIPTION: Renders a black line between points (430, 109) and (229, 166).
; PLAN: r0=430(x1), r1=109(y1), r2=229(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 109
LDI r2, 229
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
