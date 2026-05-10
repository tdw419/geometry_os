; DESCRIPTION: Composite: Creates a cyan circular shape at (222, 109) with radius 66 then Places a purple 13x14 rectangle at position (338, 108) then Renders a cyan line between points (232, 10) and (60, 190).
; PLAN: r0=222(x), r1=109(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x), r6=108(y), r7=13(width), r8=14(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=232(x1), r11=10(y1), r12=60(x2), r13=190(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 109
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 108
LDI r7, 13
LDI r8, 14
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 10
LDI r12, 60
LDI r13, 190
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
