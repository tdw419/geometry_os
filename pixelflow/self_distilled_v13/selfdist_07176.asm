; DESCRIPTION: Creates a vertical purple gradient from black to purple.
; PLAN: r0=4(x), r1=10(y1), r2=1(x2), r3=12(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 10
LDI r2, 1
LDI r3, 12
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
