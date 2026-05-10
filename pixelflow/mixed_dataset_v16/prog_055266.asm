; DESCRIPTION: Composite: Creates a blue circular shape at (196, 144) with radius 63 then Places a purple dot at position (368, 117).
; PLAN: r0=196(x), r1=144(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=117(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 196
LDI r1, 144
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 117
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
