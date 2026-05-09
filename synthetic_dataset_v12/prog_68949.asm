; DESCRIPTION: Composite: Renders a cyan disk with center (108, 118) and radius 67 then Places a red dot at position (12, 179).
; PLAN: r0=108(x), r1=118(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x), r6=179(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 108
LDI r1, 118
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 179
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
