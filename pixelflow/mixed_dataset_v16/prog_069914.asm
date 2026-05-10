; DESCRIPTION: Places a black line segment connecting (286, 93) to (316, 214).
; PLAN: r0=286(x1), r1=93(y1), r2=316(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 93
LDI r2, 316
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
