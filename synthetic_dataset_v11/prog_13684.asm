; DESCRIPTION: Composite: . Then Sets a single yellow pixel at (66, 253). Then Renders a purple box of size 54x82 starting at (85, 89).
; PLAN: r0=66(x), r1=253(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r0=85(x), r1=89(y), r2=54(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Sets a single yellow pixel at (66, 253).
; PLAN: r0=66(x), r1=253(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 66
LDI r1, 253
LDI r2, 0xFFFF00
PSET r0, r1, r2
; DESCRIPTION: Renders a purple box of size 54x82 starting at (85, 89).
; PLAN: r0=85(x), r1=89(y), r2=54(width), r3=82(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 89
LDI r2, 54
LDI r3, 82
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
