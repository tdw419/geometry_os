; DESCRIPTION: Renders a black line between points (178, 125) and (98, 179).
; PLAN: r0=178(x1), r1=125(y1), r2=98(x2), r3=179(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 125
LDI r2, 98
LDI r3, 179
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
