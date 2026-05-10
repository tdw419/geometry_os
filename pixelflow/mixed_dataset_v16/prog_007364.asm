; DESCRIPTION: Composite: Renders a orange line between points (339, 193) and (173, 141) then Places a cyan dot at position (94, 140) then Places a purple 62x96 rectangle at position (87, 140).
; PLAN: r0=339(x1), r1=193(y1), r2=173(x2), r3=141(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=94(x), r6=140(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=87(x), r11=140(y), r12=62(width), r13=96(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 193
LDI r2, 173
LDI r3, 141
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 94
LDI r6, 140
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 87
LDI r11, 140
LDI r12, 62
LDI r13, 96
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
