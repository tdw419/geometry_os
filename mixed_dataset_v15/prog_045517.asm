; DESCRIPTION: Composite: Creates a purple circular shape at (179, 65) with radius 47 then Places a white dot at position (70, 221) then Places a red 35x65 rectangle at position (326, 74).
; PLAN: r0=179(x), r1=65(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=70(x), r6=221(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=326(x), r11=74(y), r12=35(width), r13=65(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 65
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 70
LDI r6, 221
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 326
LDI r11, 74
LDI r12, 35
LDI r13, 65
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
