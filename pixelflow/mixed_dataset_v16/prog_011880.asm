; DESCRIPTION: Composite: Places a blue circle of radius 68 at center (341, 155) then Places a magenta dot at position (409, 39).
; PLAN: r0=341(x), r1=155(y), r2=68(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=39(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 341
LDI r1, 155
LDI r2, 68
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 39
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
