; DESCRIPTION: Renders a black line between points (8, 214) and (139, 143).
; PLAN: r0=8(x1), r1=214(y1), r2=139(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 214
LDI r2, 139
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
