; DESCRIPTION: Composite: Places a green 83x12 rectangle at position (30, 68) then Draws a yellow circle centered at (256, 173) with radius 22 then Draws a green line from (258, 249) to (238, 4).
; PLAN: r0=30(x), r1=68(y), r2=83(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=256(x), r6=173(y), r7=22(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=258(x1), r11=249(y1), r12=238(x2), r13=4(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 68
LDI r2, 83
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 256
LDI r6, 173
LDI r7, 22
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 258
LDI r11, 249
LDI r12, 238
LDI r13, 4
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
