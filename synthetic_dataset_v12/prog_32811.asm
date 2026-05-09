; DESCRIPTION: Composite: Places a purple 28x118 rectangle at position (85, 39) then Sets a single cyan pixel at (45, 134) then Draws a cyan circle centered at (243, 175) with radius 64.
; PLAN: r0=85(x), r1=39(y), r2=28(width), r3=118(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x), r6=134(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=243(x), r11=175(y), r12=64(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 39
LDI r2, 28
LDI r3, 118
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 134
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 243
LDI r11, 175
LDI r12, 64
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
