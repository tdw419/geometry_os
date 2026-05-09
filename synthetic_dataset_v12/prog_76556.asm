; DESCRIPTION: Composite: Places a yellow dot at position (444, 9) then Places a cyan circle of radius 74 at center (108, 118).
; PLAN: r0=444(x), r1=9(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=108(x), r6=118(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 9
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 108
LDI r6, 118
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
