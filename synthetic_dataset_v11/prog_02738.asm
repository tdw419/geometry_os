; DESCRIPTION: Composite: . Then Renders a black disk with center (182, 186) and radius 18. Then Places a red dot at position (212, 194).
; PLAN: r0=182(x), r1=186(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=212(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a black disk with center (182, 186) and radius 18.
; PLAN: r0=182(x), r1=186(y), r2=18(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 182
LDI r1, 186
LDI r2, 18
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a red dot at position (212, 194).
; PLAN: r0=212(x), r1=194(y), r2=0xFF0000(color). Op: PSET r0, r1, r2.
LDI r0, 212
LDI r1, 194
LDI r2, 0xFF0000
PSET r0, r1, r2
HALT
