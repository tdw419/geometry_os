; DESCRIPTION: Composite: Places a red circle of radius 26 at center (355, 200) then Places a purple 116x26 rectangle at position (341, 171).
; PLAN: r0=355(x), r1=200(y), r2=26(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=341(x), r6=171(y), r7=116(width), r8=26(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 355
LDI r1, 200
LDI r2, 26
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 341
LDI r6, 171
LDI r7, 116
LDI r8, 26
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
