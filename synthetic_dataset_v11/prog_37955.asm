; DESCRIPTION: Composite: . Then Places a cyan line segment connecting (96, 56) to (25, 64). Then Places a black dot at position (71, 105).
; PLAN: r0=96(x1), r1=56(y1), r2=25(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=71(x), r1=105(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Places a cyan line segment connecting (96, 56) to (25, 64).
; PLAN: r0=96(x1), r1=56(y1), r2=25(x2), r3=64(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 56
LDI r2, 25
LDI r3, 64
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Places a black dot at position (71, 105).
; PLAN: r0=71(x), r1=105(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 71
LDI r1, 105
LDI r2, 0x000000
PSET r0, r1, r2
HALT
