; DESCRIPTION: Composite: Places a purple dot at position (146, 28) then Places a cyan circle of radius 54 at center (68, 147).
; PLAN: r0=146(x), r1=28(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=68(x), r6=147(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 146
LDI r1, 28
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 68
LDI r6, 147
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
