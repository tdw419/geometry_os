; DESCRIPTION: Renders a black line between points (142, 187) and (170, 174).
; PLAN: r0=142(x1), r1=187(y1), r2=170(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 187
LDI r2, 170
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
