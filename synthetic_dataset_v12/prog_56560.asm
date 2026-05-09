; DESCRIPTION: Renders a black line between points (141, 126) and (259, 146).
; PLAN: r0=141(x1), r1=126(y1), r2=259(x2), r3=146(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 126
LDI r2, 259
LDI r3, 146
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
