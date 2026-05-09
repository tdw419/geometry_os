; DESCRIPTION: Composite: Places a cyan 66x106 rectangle at position (165, 60) then Sets a single white pixel at (488, 191) then Places a green circle of radius 74 at center (202, 131).
; PLAN: r0=165(x), r1=60(y), r2=66(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=488(x), r6=191(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=202(x), r11=131(y), r12=74(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 60
LDI r2, 66
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 488
LDI r6, 191
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 202
LDI r11, 131
LDI r12, 74
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
