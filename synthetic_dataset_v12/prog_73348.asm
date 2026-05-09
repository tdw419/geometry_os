; DESCRIPTION: Renders a black line between points (131, 183) and (32, 126).
; PLAN: r0=131(x1), r1=183(y1), r2=32(x2), r3=126(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 183
LDI r2, 32
LDI r3, 126
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
