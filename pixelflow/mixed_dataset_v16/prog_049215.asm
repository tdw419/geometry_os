; DESCRIPTION: Renders a black line between points (399, 249) and (190, 14).
; PLAN: r0=399(x1), r1=249(y1), r2=190(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 249
LDI r2, 190
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
