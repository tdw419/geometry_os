; DESCRIPTION: Composite: Places a red circle of radius 19 at center (342, 72) then Places a cyan dot at position (367, 168).
; PLAN: r0=342(x), r1=72(y), r2=19(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=168(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 342
LDI r1, 72
LDI r2, 19
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 168
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
