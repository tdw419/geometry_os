; DESCRIPTION: Composite: . Then Places a orange line segment connecting (213, 142) to (177, 179). Then Places a blue dot at position (126, 100).
; PLAN: r0=213(x1), r1=142(y1), r2=177(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=126(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a orange line segment connecting (213, 142) to (177, 179).
; PLAN: r0=213(x1), r1=142(y1), r2=177(x2), r3=179(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 142
LDI r2, 177
LDI r3, 179
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a blue dot at position (126, 100).
; PLAN: r0=126(x), r1=100(y), r2=0x0000FF(color). Op: PSET r0, r1, r2.
LDI r0, 126
LDI r1, 100
LDI r2, 0x0000FF
PSET r0, r1, r2
HALT
