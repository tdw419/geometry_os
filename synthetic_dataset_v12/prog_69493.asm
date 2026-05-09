; DESCRIPTION: Composite: Places a purple 59x45 rectangle at position (131, 190) then Places a purple circle of radius 17 at center (143, 199).
; PLAN: r0=131(x), r1=190(y), r2=59(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=143(x), r6=199(y), r7=17(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 131
LDI r1, 190
LDI r2, 59
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 199
LDI r7, 17
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
