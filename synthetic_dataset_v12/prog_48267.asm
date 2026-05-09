; DESCRIPTION: Composite: Sets a single yellow pixel at (444, 165) then Renders a cyan disk with center (327, 146) and radius 43.
; PLAN: r0=444(x), r1=165(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=146(y), r7=43(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 444
LDI r1, 165
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 146
LDI r7, 43
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
