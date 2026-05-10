; DESCRIPTION: Composite: Places a magenta circle of radius 33 at center (154, 177) then Places a blue dot at position (258, 153).
; PLAN: r0=154(x), r1=177(y), r2=33(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=258(x), r6=153(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 154
LDI r1, 177
LDI r2, 33
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 258
LDI r6, 153
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
