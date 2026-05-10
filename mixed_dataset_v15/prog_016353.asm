; DESCRIPTION: Composite: Places a green dot at position (139, 198) then Places a cyan circle of radius 11 at center (150, 55).
; PLAN: r0=139(x), r1=198(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=150(x), r6=55(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 139
LDI r1, 198
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 150
LDI r6, 55
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
