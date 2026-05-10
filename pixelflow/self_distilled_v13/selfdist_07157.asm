; DESCRIPTION: Creates a vertical green gradient from black to green.
; PLAN: r0=4(x), r1=18(y), r2=1(x2), r3=1(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 18
LDI r2, 1
LDI r3, 1
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
