; DESCRIPTION: Composite: Sets a single white pixel at (315, 71) then Renders a cyan box of size 60x75 starting at (23, 151).
; PLAN: r0=315(x), r1=71(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=23(x), r6=151(y), r7=60(width), r8=75(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 315
LDI r1, 71
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 23
LDI r6, 151
LDI r7, 60
LDI r8, 75
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
