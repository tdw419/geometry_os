; DESCRIPTION: Composite: Places a red circle of radius 26 at center (352, 27) then Places a cyan dot at position (202, 254).
; PLAN: r0=352(x), r1=27(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=202(x), r6=254(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 352
LDI r1, 27
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 202
LDI r6, 254
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
