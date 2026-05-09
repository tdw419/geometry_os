; DESCRIPTION: Composite: Draws a green rectangle at (253, 121) with width 53 and height 109 then Places a purple dot at position (193, 79) then Places a purple circle of radius 68 at center (292, 118).
; PLAN: r0=253(x), r1=121(y), r2=53(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=193(x), r6=79(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=292(x), r11=118(y), r12=68(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 253
LDI r1, 121
LDI r2, 53
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 79
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 292
LDI r11, 118
LDI r12, 68
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
