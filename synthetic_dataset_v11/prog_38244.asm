; DESCRIPTION: Composite: . Then Places a red line segment connecting (32, 11) to (31, 235). Then Places a blue dot at position (90, 36).
; PLAN: r0=32(x1), r1=11(y1), r2=31(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=90(x), r1=36(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a red line segment connecting (32, 11) to (31, 235).
; PLAN: r0=32(x1), r1=11(y1), r2=31(x2), r3=235(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 11
LDI r2, 31
LDI r3, 235
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (90, 36).
; PLAN: r0=90(x), r1=36(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 90
LDI r1, 36
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
