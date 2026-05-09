; DESCRIPTION: Renders a black line between points (207, 214) and (248, 35).
; PLAN: r0=207(x1), r1=214(y1), r2=248(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 214
LDI r2, 248
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
