; DESCRIPTION: Renders a black line between points (187, 119) and (408, 100).
; PLAN: r0=187(x1), r1=119(y1), r2=408(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 119
LDI r2, 408
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
