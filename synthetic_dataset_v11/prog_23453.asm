; DESCRIPTION: Renders a black line between points (231, 102) and (140, 71).
; PLAN: r0=231(x1), r1=102(y1), r2=140(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 102
LDI r2, 140
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
