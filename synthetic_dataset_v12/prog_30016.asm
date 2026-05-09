; DESCRIPTION: Composite: Sets a single blue pixel at (263, 250) then Places a purple circle of radius 35 at center (307, 164).
; PLAN: r0=263(x), r1=250(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=307(x), r6=164(y), r7=35(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 250
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 307
LDI r6, 164
LDI r7, 35
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
