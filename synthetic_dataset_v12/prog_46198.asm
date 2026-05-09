; DESCRIPTION: Composite: Places a purple dot at position (114, 163) then Renders a green box of size 14x21 starting at (141, 97).
; PLAN: r0=114(x), r1=163(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=141(x), r6=97(y), r7=14(width), r8=21(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 163
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 141
LDI r6, 97
LDI r7, 14
LDI r8, 21
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
