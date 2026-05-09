; DESCRIPTION: Renders a black line between points (308, 236) and (214, 2).
; PLAN: r0=308(x1), r1=236(y1), r2=214(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 236
LDI r2, 214
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
