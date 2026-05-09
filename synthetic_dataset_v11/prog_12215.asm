; DESCRIPTION: Renders a black line between points (37, 214) and (212, 172).
; PLAN: r0=37(x1), r1=214(y1), r2=212(x2), r3=172(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 214
LDI r2, 212
LDI r3, 172
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
