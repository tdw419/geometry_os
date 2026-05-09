; DESCRIPTION: Renders a black line between points (243, 126) and (104, 58).
; PLAN: r0=243(x1), r1=126(y1), r2=104(x2), r3=58(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 126
LDI r2, 104
LDI r3, 58
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
