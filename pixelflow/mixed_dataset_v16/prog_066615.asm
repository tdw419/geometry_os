; DESCRIPTION: Composite: Renders a green box of size 55x56 starting at (310, 158) then Sets a single yellow pixel at (190, 160).
; PLAN: r0=310(x), r1=158(y), r2=55(width), r3=56(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=160(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 310
LDI r1, 158
LDI r2, 55
LDI r3, 56
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 160
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
