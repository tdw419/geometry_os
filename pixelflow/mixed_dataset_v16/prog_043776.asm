; DESCRIPTION: Places a black line segment connecting (120, 245) to (27, 237).
; PLAN: r0=120(x1), r1=245(y1), r2=27(x2), r3=237(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 245
LDI r2, 27
LDI r3, 237
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
