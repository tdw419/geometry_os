; DESCRIPTION: Composite: Sets a single yellow pixel at (334, 121) then Renders a black box of size 10x85 starting at (23, 109).
; PLAN: r0=334(x), r1=121(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=109(y), r7=10(width), r8=85(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 334
LDI r1, 121
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 23
LDI r6, 109
LDI r7, 10
LDI r8, 85
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
