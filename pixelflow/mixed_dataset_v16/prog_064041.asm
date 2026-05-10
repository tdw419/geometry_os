; DESCRIPTION: Composite: Sets a single yellow pixel at (279, 11) then Renders a purple box of size 93x40 starting at (289, 17).
; PLAN: r0=279(x), r1=11(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=17(y), r7=93(width), r8=40(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 279
LDI r1, 11
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 289
LDI r6, 17
LDI r7, 93
LDI r8, 40
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
