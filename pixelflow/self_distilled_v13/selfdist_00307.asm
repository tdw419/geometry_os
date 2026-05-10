; DESCRIPTION: Creates a vertical purple gradient from black to purple.
; PLAN: r0=0(x), r1=18(y1), r2=9(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 18
LDI r2, 9
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
