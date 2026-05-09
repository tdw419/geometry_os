; DESCRIPTION: Composite: Places a black 108x46 rectangle at position (319, 201) then Places a purple dot at position (222, 253).
; PLAN: r0=319(x), r1=201(y), r2=108(width), r3=46(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x), r6=253(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 319
LDI r1, 201
LDI r2, 108
LDI r3, 46
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 253
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
