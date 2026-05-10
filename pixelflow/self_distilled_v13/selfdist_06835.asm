; DESCRIPTION: Creates a vertical magenta gradient from black to magenta.
; PLAN: r0=4(x), r1=1(y), r2=1(x2), r3=9(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 1
LDI r2, 1
LDI r3, 9
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
