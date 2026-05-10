; DESCRIPTION: Places a yellow line segment connecting (483, 235) to (361, 93).
; PLAN: r0=483(x1), r1=235(y1), r2=361(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 483
LDI r1, 235
LDI r2, 361
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
