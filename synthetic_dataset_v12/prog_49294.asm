; DESCRIPTION: Composite: Renders a red box of size 15x50 starting at (139, 93) then Places a blue circle of radius 21 at center (419, 81) then Renders a magenta line between points (469, 55) and (192, 54).
; PLAN: r0=139(x), r1=93(y), r2=15(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=419(x), r6=81(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=469(x1), r11=55(y1), r12=192(x2), r13=54(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 93
LDI r2, 15
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 419
LDI r6, 81
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 469
LDI r11, 55
LDI r12, 192
LDI r13, 54
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
