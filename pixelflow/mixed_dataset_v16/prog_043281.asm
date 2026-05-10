; DESCRIPTION: Renders a black line between points (511, 44) and (52, 60).
; PLAN: r0=511(x1), r1=44(y1), r2=52(x2), r3=60(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 511
LDI r1, 44
LDI r2, 52
LDI r3, 60
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
