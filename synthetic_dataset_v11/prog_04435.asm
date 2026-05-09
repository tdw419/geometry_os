; DESCRIPTION: Renders a black line between points (177, 63) and (179, 168).
; PLAN: r0=177(x1), r1=63(y1), r2=179(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 63
LDI r2, 179
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
