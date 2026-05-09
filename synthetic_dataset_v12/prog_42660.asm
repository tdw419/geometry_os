; DESCRIPTION: Renders a black line between points (301, 106) and (454, 242).
; PLAN: r0=301(x1), r1=106(y1), r2=454(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 106
LDI r2, 454
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
