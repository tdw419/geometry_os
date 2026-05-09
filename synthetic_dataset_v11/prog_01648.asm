; DESCRIPTION: Places a black line segment connecting (249, 139) to (143, 138).
; PLAN: r0=249(x1), r1=139(y1), r2=143(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 139
LDI r2, 143
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
