; DESCRIPTION: Composite: Creates a cyan circular shape at (317, 163) with radius 67 then Draws a cyan line from (325, 191) to (137, 247) then Places a yellow 95x67 rectangle at position (155, 34).
; PLAN: r0=317(x), r1=163(y), r2=67(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x1), r6=191(y1), r7=137(x2), r8=247(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=155(x), r11=34(y), r12=95(width), r13=67(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 163
LDI r2, 67
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 191
LDI r7, 137
LDI r8, 247
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 155
LDI r11, 34
LDI r12, 95
LDI r13, 67
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
