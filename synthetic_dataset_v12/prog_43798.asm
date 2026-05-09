; DESCRIPTION: Composite: Draws a green line from (419, 211) to (308, 108) then Places a purple circle of radius 58 at center (206, 197) then Places a cyan 85x17 rectangle at position (126, 197).
; PLAN: r0=419(x1), r1=211(y1), r2=308(x2), r3=108(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=206(x), r6=197(y), r7=58(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=126(x), r11=197(y), r12=85(width), r13=17(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 211
LDI r2, 308
LDI r3, 108
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 206
LDI r6, 197
LDI r7, 58
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 126
LDI r11, 197
LDI r12, 85
LDI r13, 17
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
