; DESCRIPTION: Renders a black line between points (178, 26) and (36, 64).
; PLAN: r0=178(x1), r1=26(y1), r2=36(x2), r3=64(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 26
LDI r2, 36
LDI r3, 64
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
