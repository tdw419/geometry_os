; DESCRIPTION: Renders a black line between points (356, 21) and (429, 20).
; PLAN: r0=356(x1), r1=21(y1), r2=429(x2), r3=20(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 21
LDI r2, 429
LDI r3, 20
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
