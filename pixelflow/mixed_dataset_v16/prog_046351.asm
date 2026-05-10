; DESCRIPTION: Composite: Places a magenta circle of radius 49 at center (132, 63) then Places a yellow dot at position (131, 172).
; PLAN: r0=132(x), r1=63(y), r2=49(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=172(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 132
LDI r1, 63
LDI r2, 49
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 172
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
