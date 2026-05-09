; DESCRIPTION: Composite: Creates a white circular shape at (440, 211) with radius 22 then Places a purple dot at position (237, 202).
; PLAN: r0=440(x), r1=211(y), r2=22(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=202(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7.
LDI r0, 440
LDI r1, 211
LDI r2, 22
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 202
LDI r7, 0xAA00FF
PSET r5, r6, r7
HALT
