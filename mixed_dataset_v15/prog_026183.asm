; DESCRIPTION: Composite: Places a black dot at position (50, 95) then Places a cyan circle of radius 63 at center (281, 83).
; PLAN: r0=50(x), r1=95(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=281(x), r6=83(y), r7=63(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 50
LDI r1, 95
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 281
LDI r6, 83
LDI r7, 63
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
