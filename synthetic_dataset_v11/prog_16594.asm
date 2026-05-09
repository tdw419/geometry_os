; DESCRIPTION: Composite: . Then Sets a single white pixel at (6, 150). Then Renders a black box of size 117x118 starting at (133, 60).
; PLAN: r0=6(x), r1=150(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r0=133(x), r1=60(y), r2=117(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single white pixel at (6, 150).
; PLAN: r0=6(x), r1=150(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2.
LDI r0, 6
LDI r1, 150
LDI r2, 0xFFFFFF
PSET r0, r1, r2
; DESCRIPTION: Renders a black box of size 117x118 starting at (133, 60).
; PLAN: r0=133(x), r1=60(y), r2=117(width), r3=118(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 60
LDI r2, 117
LDI r3, 118
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
