; DESCRIPTION: Composite: Places a black dot at position (506, 164) then Renders a purple box of size 108x30 starting at (318, 217).
; PLAN: r0=506(x), r1=164(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=318(x), r6=217(y), r7=108(width), r8=30(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 506
LDI r1, 164
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 318
LDI r6, 217
LDI r7, 108
LDI r8, 30
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
