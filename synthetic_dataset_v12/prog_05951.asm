; DESCRIPTION: Composite: Renders a blue disk with center (422, 86) and radius 16 then Places a magenta dot at position (47, 120).
; PLAN: r0=422(x), r1=86(y), r2=16(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=47(x), r6=120(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 422
LDI r1, 86
LDI r2, 16
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 47
LDI r6, 120
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
