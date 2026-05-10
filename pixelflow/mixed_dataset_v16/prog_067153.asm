; DESCRIPTION: Composite: Creates a yellow circular shape at (462, 111) with radius 10 then Places a blue dot at position (213, 50).
; PLAN: r0=462(x), r1=111(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=213(x), r6=50(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 462
LDI r1, 111
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 213
LDI r6, 50
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
