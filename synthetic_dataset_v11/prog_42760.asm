; DESCRIPTION: Draws a black line from (48, 106) to (55, 89).
; PLAN: r0=48(x1), r1=106(y1), r2=55(x2), r3=89(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 106
LDI r2, 55
LDI r3, 89
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
