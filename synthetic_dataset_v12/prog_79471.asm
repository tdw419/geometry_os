; DESCRIPTION: Composite: Renders a cyan box of size 80x18 starting at (150, 95) then Renders a magenta disk with center (154, 187) and radius 44 then Renders a orange line between points (175, 217) and (484, 109).
; PLAN: r0=150(x), r1=95(y), r2=80(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x), r6=187(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x1), r11=217(y1), r12=484(x2), r13=109(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 150
LDI r1, 95
LDI r2, 80
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 187
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 217
LDI r12, 484
LDI r13, 109
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
