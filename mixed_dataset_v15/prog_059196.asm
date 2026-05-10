; DESCRIPTION: Composite: Places a black dot at position (186, 185) then Places a magenta circle of radius 55 at center (94, 196).
; PLAN: r0=186(x), r1=185(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=94(x), r6=196(y), r7=55(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 186
LDI r1, 185
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 94
LDI r6, 196
LDI r7, 55
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
