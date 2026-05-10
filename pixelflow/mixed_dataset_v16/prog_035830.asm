; DESCRIPTION: Composite: Sets a single black pixel at (156, 170) then Renders a blue box of size 75x60 starting at (138, 82).
; PLAN: r0=156(x), r1=170(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=138(x), r6=82(y), r7=75(width), r8=60(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 170
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 138
LDI r6, 82
LDI r7, 75
LDI r8, 60
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
