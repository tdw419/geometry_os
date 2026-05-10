; DESCRIPTION: Composite: Renders a magenta disk with center (95, 57) and radius 44 then Renders a yellow box of size 77x16 starting at (306, 78) then Places a red line segment connecting (465, 211) to (402, 171).
; PLAN: r0=95(x), r1=57(y), r2=44(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=306(x), r6=78(y), r7=77(width), r8=16(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=465(x1), r11=211(y1), r12=402(x2), r13=171(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 95
LDI r1, 57
LDI r2, 44
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 306
LDI r6, 78
LDI r7, 77
LDI r8, 16
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 465
LDI r11, 211
LDI r12, 402
LDI r13, 171
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
