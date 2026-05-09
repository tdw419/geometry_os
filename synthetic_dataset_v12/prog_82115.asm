; DESCRIPTION: Renders a green line between points (361, 97) and (145, 116).
; PLAN: r0=361(x1), r1=97(y1), r2=145(x2), r3=116(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 97
LDI r2, 145
LDI r3, 116
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
