; DESCRIPTION: Renders a black line between points (322, 13) and (225, 56).
; PLAN: r0=322(x1), r1=13(y1), r2=225(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 13
LDI r2, 225
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
