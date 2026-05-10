; DESCRIPTION: Composite: Renders a red disk with center (301, 90) and radius 78 then Places a black 62x48 rectangle at position (312, 57) then Places a magenta line segment connecting (154, 40) to (276, 34).
; PLAN: r0=301(x), r1=90(y), r2=78(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=57(y), r7=62(width), r8=48(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=154(x1), r11=40(y1), r12=276(x2), r13=34(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 301
LDI r1, 90
LDI r2, 78
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 57
LDI r7, 62
LDI r8, 48
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 154
LDI r11, 40
LDI r12, 276
LDI r13, 34
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
