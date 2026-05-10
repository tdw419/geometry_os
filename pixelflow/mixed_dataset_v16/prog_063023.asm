; DESCRIPTION: Composite: Places a purple 33x112 rectangle at position (182, 18) then Places a black dot at position (166, 208).
; PLAN: r0=182(x), r1=18(y), r2=33(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=166(x), r6=208(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 182
LDI r1, 18
LDI r2, 33
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 166
LDI r6, 208
LDI r7, 0x000000
PSET r5, r6, r7
HALT
