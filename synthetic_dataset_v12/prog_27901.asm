; DESCRIPTION: Composite: Renders a magenta disk with center (103, 130) and radius 38 then Places a black dot at position (46, 97).
; PLAN: r0=103(x), r1=130(y), r2=38(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=97(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 103
LDI r1, 130
LDI r2, 38
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 97
LDI r7, 0x000000
PSET r5, r6, r7
HALT
