; DESCRIPTION: Renders a black line between points (69, 43) and (190, 56).
; PLAN: r0=69(x1), r1=43(y1), r2=190(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 43
LDI r2, 190
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
