; DESCRIPTION: Composite: . Then Sets a single black pixel at (142, 182). Then Draws a cyan circle centered at (221, 137) with radius 26.
; PLAN: r0=142(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r0=221(x), r1=137(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Sets a single black pixel at (142, 182).
; PLAN: r0=142(x), r1=182(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 142
LDI r1, 182
LDI r2, 0x000000
PSET r0, r1, r2
; DESCRIPTION: Draws a cyan circle centered at (221, 137) with radius 26.
; PLAN: r0=221(x), r1=137(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 221
LDI r1, 137
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
