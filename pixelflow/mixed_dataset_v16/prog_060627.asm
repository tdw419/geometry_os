; DESCRIPTION: Composite: Renders a red line between points (264, 122) and (87, 63) then Sets a single black pixel at (507, 11) then Places a green 45x30 rectangle at position (454, 222).
; PLAN: r0=264(x1), r1=122(y1), r2=87(x2), r3=63(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=507(x), r6=11(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=454(x), r11=222(y), r12=45(width), r13=30(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 264
LDI r1, 122
LDI r2, 87
LDI r3, 63
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 507
LDI r6, 11
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 454
LDI r11, 222
LDI r12, 45
LDI r13, 30
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
