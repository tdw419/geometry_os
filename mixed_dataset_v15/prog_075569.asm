; DESCRIPTION: Renders a black line between points (185, 249) and (449, 174).
; PLAN: r0=185(x1), r1=249(y1), r2=449(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 249
LDI r2, 449
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
