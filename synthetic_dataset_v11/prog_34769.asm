; DESCRIPTION: Composite: . Then Renders a yellow box of size 22x37 starting at (212, 36). Then Sets a single yellow pixel at (19, 245).
; PLAN: r0=212(x), r1=36(y), r2=22(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=19(x), r1=245(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a yellow box of size 22x37 starting at (212, 36).
; PLAN: r0=212(x), r1=36(y), r2=22(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 36
LDI r2, 22
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Sets a single yellow pixel at (19, 245).
; PLAN: r0=19(x), r1=245(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 19
LDI r1, 245
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
