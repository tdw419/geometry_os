; DESCRIPTION: Composite: Draws a orange circle centered at (332, 160) with radius 19 then Renders a purple line between points (379, 136) and (439, 37) then Places a cyan 120x10 rectangle at position (82, 244).
; PLAN: r0=332(x), r1=160(y), r2=19(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x1), r6=136(y1), r7=439(x2), r8=37(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=82(x), r11=244(y), r12=120(width), r13=10(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 160
LDI r2, 19
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 136
LDI r7, 439
LDI r8, 37
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 82
LDI r11, 244
LDI r12, 120
LDI r13, 10
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
