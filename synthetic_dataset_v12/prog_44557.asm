; DESCRIPTION: Renders a black line between points (123, 190) and (326, 40).
; PLAN: r0=123(x1), r1=190(y1), r2=326(x2), r3=40(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 190
LDI r2, 326
LDI r3, 40
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
