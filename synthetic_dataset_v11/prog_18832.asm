; DESCRIPTION: Renders a black line between points (114, 126) and (225, 192).
; PLAN: r0=114(x1), r1=126(y1), r2=225(x2), r3=192(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 126
LDI r2, 225
LDI r3, 192
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
