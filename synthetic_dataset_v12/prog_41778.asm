; DESCRIPTION: Renders a black line between points (382, 229) and (306, 241).
; PLAN: r0=382(x1), r1=229(y1), r2=306(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 229
LDI r2, 306
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
