; DESCRIPTION: Composite: Places a red circle of radius 28 at center (39, 215) then Places a cyan dot at position (147, 26).
; PLAN: r0=39(x), r1=215(y), r2=28(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=147(x), r6=26(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 39
LDI r1, 215
LDI r2, 28
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 147
LDI r6, 26
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
