; DESCRIPTION: Composite: Renders a green disk with center (464, 46) and radius 45 then Places a cyan dot at position (111, 156).
; PLAN: r0=464(x), r1=46(y), r2=45(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=156(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 464
LDI r1, 46
LDI r2, 45
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 156
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
