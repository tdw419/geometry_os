; DESCRIPTION: Composite: Places a green circle of radius 73 at center (278, 117) then Places a black 24x119 rectangle at position (217, 38).
; PLAN: r0=278(x), r1=117(y), r2=73(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=217(x), r6=38(y), r7=24(width), r8=119(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 278
LDI r1, 117
LDI r2, 73
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 217
LDI r6, 38
LDI r7, 24
LDI r8, 119
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
