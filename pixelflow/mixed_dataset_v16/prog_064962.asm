; DESCRIPTION: Renders a black line between points (1, 144) and (79, 241).
; PLAN: r0=1(x1), r1=144(y1), r2=79(x2), r3=241(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 144
LDI r2, 79
LDI r3, 241
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
