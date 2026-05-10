; DESCRIPTION: Creates a vertical purple gradient from black to purple.
; PLAN: r0=3(x1), r1=37(y1), r2=4(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 37
LDI r2, 4
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
