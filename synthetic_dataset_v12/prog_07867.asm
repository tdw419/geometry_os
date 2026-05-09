; DESCRIPTION: Composite: Renders a blue box of size 34x99 starting at (87, 2) then Sets a single black pixel at (111, 191).
; PLAN: r0=87(x), r1=2(y), r2=34(width), r3=99(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=111(x), r6=191(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 87
LDI r1, 2
LDI r2, 34
LDI r3, 99
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 111
LDI r6, 191
LDI r7, 0x000000
PSET r5, r6, r7
HALT
