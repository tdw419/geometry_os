; DESCRIPTION: Composite: Creates a white circular shape at (330, 114) with radius 70 then Places a blue dot at position (464, 254).
; PLAN: r0=330(x), r1=114(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=464(x), r6=254(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 330
LDI r1, 114
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 464
LDI r6, 254
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
