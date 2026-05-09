; DESCRIPTION: Renders a yellow line between points (205, 235) and (285, 80).
; PLAN: r0=205(x1), r1=235(y1), r2=285(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 235
LDI r2, 285
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
