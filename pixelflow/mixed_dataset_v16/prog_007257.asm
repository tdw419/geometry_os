; DESCRIPTION: Composite: Places a blue circle of radius 74 at center (373, 101) then Places a red 68x62 rectangle at position (358, 147) then Places a white line segment connecting (269, 55) to (50, 54).
; PLAN: r0=373(x), r1=101(y), r2=74(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=147(y), r7=68(width), r8=62(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=269(x1), r11=55(y1), r12=50(x2), r13=54(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 373
LDI r1, 101
LDI r2, 74
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 147
LDI r7, 68
LDI r8, 62
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 269
LDI r11, 55
LDI r12, 50
LDI r13, 54
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
