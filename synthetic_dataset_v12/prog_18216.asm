; DESCRIPTION: Composite: Renders a cyan box of size 111x71 starting at (395, 136) then Sets a single purple pixel at (116, 201).
; PLAN: r0=395(x), r1=136(y), r2=111(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=116(x), r6=201(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 395
LDI r1, 136
LDI r2, 111
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 116
LDI r6, 201
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
