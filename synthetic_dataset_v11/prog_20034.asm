; DESCRIPTION: Places a black line segment connecting (37, 93) to (214, 187).
; PLAN: r0=37(x1), r1=93(y1), r2=214(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 93
LDI r2, 214
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
