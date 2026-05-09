; DESCRIPTION: Composite: Places a cyan 14x32 rectangle at position (183, 190) then Places a white circle of radius 44 at center (72, 106).
; PLAN: r0=183(x), r1=190(y), r2=14(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=72(x), r6=106(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 190
LDI r2, 14
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 72
LDI r6, 106
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
