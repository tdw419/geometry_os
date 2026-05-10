; DESCRIPTION: Renders a green line between points (340, 235) and (471, 23).
; PLAN: r0=340(x1), r1=235(y1), r2=471(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 235
LDI r2, 471
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
