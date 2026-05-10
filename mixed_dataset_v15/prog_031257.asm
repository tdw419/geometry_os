; DESCRIPTION: Composite: Places a yellow circle of radius 67 at center (161, 185) then Places a red dot at position (323, 164).
; PLAN: r0=161(x), r1=185(y), r2=67(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=323(x), r6=164(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 161
LDI r1, 185
LDI r2, 67
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 323
LDI r6, 164
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
