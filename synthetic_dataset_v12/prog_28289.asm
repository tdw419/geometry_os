; DESCRIPTION: Composite: Sets a single red pixel at (167, 23) then Renders a purple box of size 29x64 starting at (132, 49).
; PLAN: r0=167(x), r1=23(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=132(x), r6=49(y), r7=29(width), r8=64(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 23
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 132
LDI r6, 49
LDI r7, 29
LDI r8, 64
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
