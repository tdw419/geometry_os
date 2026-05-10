; DESCRIPTION: Composite: Places a white 89x68 rectangle at position (274, 86) then Places a magenta circle of radius 38 at center (132, 155) then Places a purple dot at position (133, 190).
; PLAN: r0=274(x), r1=86(y), r2=89(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=132(x), r6=155(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=133(x), r11=190(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 274
LDI r1, 86
LDI r2, 89
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 132
LDI r6, 155
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 133
LDI r11, 190
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
