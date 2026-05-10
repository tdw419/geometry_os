; DESCRIPTION: Composite: Places a purple 97x57 rectangle at position (341, 39) then Creates a red circular shape at (439, 211) with radius 33.
; PLAN: r0=341(x), r1=39(y), r2=97(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=211(y), r7=33(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 341
LDI r1, 39
LDI r2, 97
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 211
LDI r7, 33
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
