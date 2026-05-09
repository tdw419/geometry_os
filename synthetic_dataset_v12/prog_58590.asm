; DESCRIPTION: Renders a black line between points (292, 143) and (186, 23).
; PLAN: r0=292(x1), r1=143(y1), r2=186(x2), r3=23(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 143
LDI r2, 186
LDI r3, 23
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
