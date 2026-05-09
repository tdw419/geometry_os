; DESCRIPTION: Composite: . Then Renders a white box of size 93x118 starting at (41, 135). Then Sets a single black pixel at (201, 185).
; PLAN: r0=41(x), r1=135(y), r2=93(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=201(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a white box of size 93x118 starting at (41, 135).
; PLAN: r0=41(x), r1=135(y), r2=93(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 135
LDI r2, 93
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single black pixel at (201, 185).
; PLAN: r0=201(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2.
LDI r0, 201
LDI r1, 185
LDI r2, 0x000000
PSET r0, r1, r2
HALT
