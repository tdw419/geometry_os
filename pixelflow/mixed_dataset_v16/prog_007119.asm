; DESCRIPTION: Composite: Creates a magenta circular shape at (62, 120) with radius 40 then Places a blue dot at position (233, 108).
; PLAN: r0=62(x), r1=120(y), r2=40(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=233(x), r6=108(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 62
LDI r1, 120
LDI r2, 40
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 233
LDI r6, 108
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
