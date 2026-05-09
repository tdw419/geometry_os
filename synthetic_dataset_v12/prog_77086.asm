; DESCRIPTION: Composite: Places a purple 111x62 rectangle at position (272, 103) then Sets a single purple pixel at (177, 253).
; PLAN: r0=272(x), r1=103(y), r2=111(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=177(x), r6=253(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 272
LDI r1, 103
LDI r2, 111
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 177
LDI r6, 253
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
