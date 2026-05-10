; DESCRIPTION: Composite: Places a black dot at position (136, 87) then Renders a purple box of size 102x107 starting at (292, 25).
; PLAN: r0=136(x), r1=87(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=292(x), r6=25(y), r7=102(width), r8=107(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 136
LDI r1, 87
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 292
LDI r6, 25
LDI r7, 102
LDI r8, 107
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
