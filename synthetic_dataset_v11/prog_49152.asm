; DESCRIPTION: Renders a black line between points (50, 230) and (170, 249).
; PLAN: r0=50(x1), r1=230(y1), r2=170(x2), r3=249(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 230
LDI r2, 170
LDI r3, 249
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
