; DESCRIPTION: Renders a yellow line between points (285, 4) and (463, 132).
; PLAN: r0=285(x1), r1=4(y1), r2=463(x2), r3=132(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 4
LDI r2, 463
LDI r3, 132
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
