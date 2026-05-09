; DESCRIPTION: Renders a black line between points (125, 44) and (508, 195).
; PLAN: r0=125(x1), r1=44(y1), r2=508(x2), r3=195(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 44
LDI r2, 508
LDI r3, 195
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
