; DESCRIPTION: Composite: Places a red 24x113 rectangle at position (153, 96) then Sets a single purple pixel at (86, 80) then Creates a green circular shape at (449, 115) with radius 16.
; PLAN: r0=153(x), r1=96(y), r2=24(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=86(x), r6=80(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=449(x), r11=115(y), r12=16(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 96
LDI r2, 24
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 86
LDI r6, 80
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 449
LDI r11, 115
LDI r12, 16
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
