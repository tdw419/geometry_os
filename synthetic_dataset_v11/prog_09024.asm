; DESCRIPTION: Renders a black line between points (44, 36) and (45, 143).
; PLAN: r0=44(x1), r1=36(y1), r2=45(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 36
LDI r2, 45
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
