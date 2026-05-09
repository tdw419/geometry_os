; DESCRIPTION: Renders a blue line between points (452, 18) and (365, 66).
; PLAN: r0=452(x1), r1=18(y1), r2=365(x2), r3=66(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 18
LDI r2, 365
LDI r3, 66
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
