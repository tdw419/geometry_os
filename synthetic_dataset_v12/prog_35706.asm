; DESCRIPTION: Composite: Creates a purple circular shape at (44, 186) with radius 18 then Places a blue 51x116 rectangle at position (391, 62).
; PLAN: r0=44(x), r1=186(y), r2=18(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=391(x), r6=62(y), r7=51(width), r8=116(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 44
LDI r1, 186
LDI r2, 18
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 391
LDI r6, 62
LDI r7, 51
LDI r8, 116
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
