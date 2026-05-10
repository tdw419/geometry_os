; DESCRIPTION: Composite: Places a cyan circle of radius 39 at center (120, 121) then Places a cyan dot at position (352, 224).
; PLAN: r0=120(x), r1=121(y), r2=39(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=352(x), r6=224(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 120
LDI r1, 121
LDI r2, 39
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 352
LDI r6, 224
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
