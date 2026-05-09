; DESCRIPTION: Composite: Places a blue dot at position (245, 28) then Places a blue circle of radius 44 at center (112, 172).
; PLAN: r0=245(x), r1=28(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=112(x), r6=172(y), r7=44(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 245
LDI r1, 28
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 112
LDI r6, 172
LDI r7, 44
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
