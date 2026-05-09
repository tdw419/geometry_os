; DESCRIPTION: Renders a black line between points (503, 156) and (449, 209).
; PLAN: r0=503(x1), r1=156(y1), r2=449(x2), r3=209(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 156
LDI r2, 449
LDI r3, 209
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
