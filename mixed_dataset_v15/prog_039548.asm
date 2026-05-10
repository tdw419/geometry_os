; DESCRIPTION: Composite: Renders a black box of size 120x78 starting at (27, 80) then Places a purple dot at position (322, 87).
; PLAN: r0=27(x), r1=80(y), r2=120(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=87(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 27
LDI r1, 80
LDI r2, 120
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 87
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
