; DESCRIPTION: Composite: . Then Places a yellow line segment connecting (64, 132) to (90, 107). Then Places a purple dot at position (11, 15).
; PLAN: r0=64(x1), r1=132(y1), r2=90(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=11(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a yellow line segment connecting (64, 132) to (90, 107).
; PLAN: r0=64(x1), r1=132(y1), r2=90(x2), r3=107(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 132
LDI r2, 90
LDI r3, 107
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (11, 15).
; PLAN: r0=11(x), r1=15(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 11
LDI r1, 15
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
