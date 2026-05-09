; DESCRIPTION: Composite: Sets a single magenta pixel at (55, 182) then Renders a black box of size 34x112 starting at (119, 99).
; PLAN: r0=55(x), r1=182(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=119(x), r6=99(y), r7=34(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 182
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 119
LDI r6, 99
LDI r7, 34
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
