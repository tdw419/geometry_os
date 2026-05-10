; DESCRIPTION: Composite: Places a black circle of radius 77 at center (153, 96) then Places a red dot at position (412, 197) then Places a cyan 11x90 rectangle at position (221, 66).
; PLAN: r0=153(x), r1=96(y), r2=77(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=412(x), r6=197(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=221(x), r11=66(y), r12=11(width), r13=90(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 96
LDI r2, 77
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 412
LDI r6, 197
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 221
LDI r11, 66
LDI r12, 11
LDI r13, 90
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
