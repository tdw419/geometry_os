; DESCRIPTION: Renders a black line between points (326, 86) and (179, 144).
; PLAN: r0=326(x1), r1=86(y1), r2=179(x2), r3=144(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 86
LDI r2, 179
LDI r3, 144
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
