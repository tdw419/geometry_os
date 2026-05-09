; DESCRIPTION: Composite: Sets a single green pixel at (165, 204) then Renders a magenta disk with center (293, 111) and radius 51.
; PLAN: r0=165(x), r1=204(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=111(y), r7=51(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 165
LDI r1, 204
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 293
LDI r6, 111
LDI r7, 51
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
