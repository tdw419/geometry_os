; DESCRIPTION: Composite: Places a magenta dot at position (191, 237) then Places a blue circle of radius 60 at center (379, 165).
; PLAN: r0=191(x), r1=237(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=379(x), r6=165(y), r7=60(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 191
LDI r1, 237
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 379
LDI r6, 165
LDI r7, 60
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
