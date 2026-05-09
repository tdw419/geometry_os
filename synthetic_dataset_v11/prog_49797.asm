; DESCRIPTION: Composite: . Then Renders a yellow box of size 100x34 starting at (94, 68). Then Sets a single yellow pixel at (139, 57).
; PLAN: r0=94(x), r1=68(y), r2=100(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=139(x), r1=57(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 100x34 starting at (94, 68).
; PLAN: r0=94(x), r1=68(y), r2=100(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 68
LDI r2, 100
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (139, 57).
; PLAN: r0=139(x), r1=57(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 139
LDI r1, 57
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
