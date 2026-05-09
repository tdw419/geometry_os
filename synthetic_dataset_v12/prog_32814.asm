; DESCRIPTION: Renders a green line between points (427, 251) and (361, 193).
; PLAN: r0=427(x1), r1=251(y1), r2=361(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 251
LDI r2, 361
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
