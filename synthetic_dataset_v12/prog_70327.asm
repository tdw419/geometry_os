; DESCRIPTION: Composite: Places a green circle of radius 74 at center (131, 156) then Draws a green rectangle at (80, 42) with width 14 and height 20 then Renders a white line between points (375, 65) and (382, 42).
; PLAN: r0=131(x), r1=156(y), r2=74(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=80(x), r6=42(y), r7=14(width), r8=20(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x1), r11=65(y1), r12=382(x2), r13=42(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 131
LDI r1, 156
LDI r2, 74
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 80
LDI r6, 42
LDI r7, 14
LDI r8, 20
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 65
LDI r12, 382
LDI r13, 42
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
