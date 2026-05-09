; DESCRIPTION: Renders a black line between points (241, 72) and (220, 143).
; PLAN: r0=241(x1), r1=72(y1), r2=220(x2), r3=143(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 72
LDI r2, 220
LDI r3, 143
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
