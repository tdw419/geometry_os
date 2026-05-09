; DESCRIPTION: Renders a black line between points (20, 97) and (90, 140).
; PLAN: r0=20(x1), r1=97(y1), r2=90(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 97
LDI r2, 90
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
