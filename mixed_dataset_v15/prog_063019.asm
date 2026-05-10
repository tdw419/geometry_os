; DESCRIPTION: Composite: Places a purple 47x49 rectangle at position (22, 163) then Places a white dot at position (190, 129).
; PLAN: r0=22(x), r1=163(y), r2=47(width), r3=49(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=129(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 22
LDI r1, 163
LDI r2, 47
LDI r3, 49
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 129
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
