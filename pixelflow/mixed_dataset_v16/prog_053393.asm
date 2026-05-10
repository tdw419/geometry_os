; DESCRIPTION: Composite: Sets a single green pixel at (134, 98) then Renders a black box of size 97x116 starting at (355, 97).
; PLAN: r0=134(x), r1=98(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=355(x), r6=97(y), r7=97(width), r8=116(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 98
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 355
LDI r6, 97
LDI r7, 97
LDI r8, 116
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
