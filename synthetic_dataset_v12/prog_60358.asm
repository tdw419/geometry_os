; DESCRIPTION: Composite: Renders a red box of size 111x50 starting at (29, 177) then Sets a single purple pixel at (151, 96).
; PLAN: r0=29(x), r1=177(y), r2=111(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x), r6=96(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 29
LDI r1, 177
LDI r2, 111
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 96
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
