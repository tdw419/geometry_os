; DESCRIPTION: Renders a black line between points (43, 185) and (230, 187).
; PLAN: r0=43(x1), r1=185(y1), r2=230(x2), r3=187(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 185
LDI r2, 230
LDI r3, 187
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
