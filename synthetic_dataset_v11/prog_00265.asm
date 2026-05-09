; DESCRIPTION: Renders a yellow line between points (235, 234) and (233, 34).
; PLAN: r0=235(x1), r1=234(y1), r2=233(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 234
LDI r2, 233
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
