; DESCRIPTION: Renders a black line between points (144, 71) and (249, 70).
; PLAN: r0=144(x1), r1=71(y1), r2=249(x2), r3=70(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 71
LDI r2, 249
LDI r3, 70
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
