; DESCRIPTION: Composite: Creates a red circular shape at (365, 58) with radius 20 then Places a purple 110x116 rectangle at position (319, 85).
; PLAN: r0=365(x), r1=58(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x), r6=85(y), r7=110(width), r8=116(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 365
LDI r1, 58
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 85
LDI r7, 110
LDI r8, 116
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
