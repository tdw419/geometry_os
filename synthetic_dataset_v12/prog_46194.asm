; DESCRIPTION: Composite: Places a green 32x99 rectangle at position (456, 15) then Places a orange dot at position (145, 219) then Places a purple circle of radius 45 at center (286, 116).
; PLAN: r0=456(x), r1=15(y), r2=32(width), r3=99(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=145(x), r6=219(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=286(x), r11=116(y), r12=45(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 456
LDI r1, 15
LDI r2, 32
LDI r3, 99
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 219
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 286
LDI r11, 116
LDI r12, 45
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
