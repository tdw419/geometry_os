; DESCRIPTION: Composite: . Then Places a black line segment connecting (40, 179) to (158, 235). Then Places a magenta dot at position (100, 186).
; PLAN: r0=40(x1), r1=179(y1), r2=158(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=100(x), r1=186(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a black line segment connecting (40, 179) to (158, 235).
; PLAN: r0=40(x1), r1=179(y1), r2=158(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 179
LDI r2, 158
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a magenta dot at position (100, 186).
; PLAN: r0=100(x), r1=186(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 100
LDI r1, 186
LDI r2, 0xFF00FF
PSET r0, r1, r2
HALT
