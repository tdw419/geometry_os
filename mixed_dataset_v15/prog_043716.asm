; DESCRIPTION: Renders a yellow line between points (244, 64) and (235, 2).
; PLAN: r0=244(x1), r1=64(y1), r2=235(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 64
LDI r2, 235
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
