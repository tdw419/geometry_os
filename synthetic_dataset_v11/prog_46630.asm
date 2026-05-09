; DESCRIPTION: Renders a yellow line between points (145, 215) and (30, 115).
; PLAN: r0=145(x1), r1=215(y1), r2=30(x2), r3=115(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 215
LDI r2, 30
LDI r3, 115
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
