; DESCRIPTION: Composite: Places a cyan dot at position (499, 188) then Renders a magenta disk with center (461, 61) and radius 11.
; PLAN: r0=499(x), r1=188(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=461(x), r6=61(y), r7=11(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 499
LDI r1, 188
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 461
LDI r6, 61
LDI r7, 11
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
