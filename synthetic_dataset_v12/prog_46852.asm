; DESCRIPTION: Composite: Renders a black disk with center (127, 154) and radius 56 then Places a yellow dot at position (312, 8).
; PLAN: r0=127(x), r1=154(y), r2=56(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=8(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 127
LDI r1, 154
LDI r2, 56
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 8
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
