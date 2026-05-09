; DESCRIPTION: Composite: Places a green circle of radius 20 at center (385, 214) then Places a purple line segment connecting (339, 74) to (394, 0) then Places a magenta 22x83 rectangle at position (276, 6).
; PLAN: r0=385(x), r1=214(y), r2=20(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=339(x1), r6=74(y1), r7=394(x2), r8=0(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=276(x), r11=6(y), r12=22(width), r13=83(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 214
LDI r2, 20
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 339
LDI r6, 74
LDI r7, 394
LDI r8, 0
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 276
LDI r11, 6
LDI r12, 22
LDI r13, 83
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
