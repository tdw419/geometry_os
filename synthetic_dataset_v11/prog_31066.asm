; DESCRIPTION: Composite: . Then Places a magenta dot at position (167, 87). Then Places a black line segment connecting (254, 20) to (101, 212).
; PLAN: r0=167(x), r1=87(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r0=254(x1), r1=20(y1), r2=101(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Places a magenta dot at position (167, 87).
; PLAN: r0=167(x), r1=87(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2.
LDI r0, 167
LDI r1, 87
LDI r2, 0xFF00FF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (254, 20) to (101, 212).
; PLAN: r0=254(x1), r1=20(y1), r2=101(x2), r3=212(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 20
LDI r2, 101
LDI r3, 212
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
