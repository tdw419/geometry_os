; DESCRIPTION: Creates a vertical white gradient from black to white.
; PLAN: r0=4(x), r1=12(y), r2=0(x2), r3=9(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 12
LDI r2, 0
LDI r3, 9
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
