; DESCRIPTION: Composite: Places a white circle of radius 54 at center (177, 198) then Places a blue dot at position (191, 57).
; PLAN: r0=177(x), r1=198(y), r2=54(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=191(x), r6=57(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 177
LDI r1, 198
LDI r2, 54
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 191
LDI r6, 57
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
