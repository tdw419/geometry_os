; DESCRIPTION: Renders a black line between points (417, 151) and (333, 22).
; PLAN: r0=417(x1), r1=151(y1), r2=333(x2), r3=22(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 151
LDI r2, 333
LDI r3, 22
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
