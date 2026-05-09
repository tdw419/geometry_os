; DESCRIPTION: Composite: Creates a white circular shape at (425, 95) with radius 61 then Places a black line segment connecting (357, 107) to (357, 154) then Renders a black box of size 17x29 starting at (3, 121).
; PLAN: r0=425(x), r1=95(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=357(x1), r6=107(y1), r7=357(x2), r8=154(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=3(x), r11=121(y), r12=17(width), r13=29(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 95
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 357
LDI r6, 107
LDI r7, 357
LDI r8, 154
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 3
LDI r11, 121
LDI r12, 17
LDI r13, 29
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
