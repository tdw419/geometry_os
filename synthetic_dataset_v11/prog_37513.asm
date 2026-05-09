; DESCRIPTION: Composite: . Then Draws a red circle centered at (41, 73) with radius 27. Then Sets a single black pixel at (68, 188).
; PLAN: r0=41(x), r1=73(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=68(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a red circle centered at (41, 73) with radius 27.
; PLAN: r0=41(x), r1=73(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 41
LDI r1, 73
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Sets a single black pixel at (68, 188).
; PLAN: r0=68(x), r1=188(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 68
LDI r1, 188
LDI r2, 0x000000
PSET r0, r1, r2
HALT
