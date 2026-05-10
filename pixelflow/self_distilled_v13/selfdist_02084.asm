; DESCRIPTION: Creates a vertical purple gradient from black to purple.
; PLAN: r0=2(x1), r1=12(y1), r2=5(x2), r3=1(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 12
LDI r2, 5
LDI r3, 1
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
