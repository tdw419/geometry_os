; DESCRIPTION: Renders a green line between points (293, 235) and (158, 99).
; PLAN: r0=293(x1), r1=235(y1), r2=158(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 235
LDI r2, 158
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
