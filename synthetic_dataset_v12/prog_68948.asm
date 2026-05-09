; DESCRIPTION: Renders a black line between points (2, 107) and (198, 115).
; PLAN: r0=2(x1), r1=107(y1), r2=198(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 107
LDI r2, 198
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
