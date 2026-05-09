; DESCRIPTION: Composite: . Then Renders a orange line between points (63, 126) and (204, 47). Then Sets a single white pixel at (131, 151).
; PLAN: r0=63(x1), r1=126(y1), r2=204(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=131(x), r1=151(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a orange line between points (63, 126) and (204, 47).
; PLAN: r0=63(x1), r1=126(y1), r2=204(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 126
LDI r2, 204
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single white pixel at (131, 151).
; PLAN: r0=131(x), r1=151(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 131
LDI r1, 151
LDI r2, 0xFFFFFF
PSET r0, r1, r2
HALT
