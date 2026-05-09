; DESCRIPTION: Composite: . Then Sets a single white pixel at (86, 23). Then Places a black line segment connecting (203, 26) to (23, 132).
; PLAN: r0=86(x), r1=23(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=203(x1), r1=26(y1), r2=23(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (86, 23).
; PLAN: r0=86(x), r1=23(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 86
LDI r1, 23
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Places a black line segment connecting (203, 26) to (23, 132).
; PLAN: r0=203(x1), r1=26(y1), r2=23(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 26
LDI r2, 23
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
