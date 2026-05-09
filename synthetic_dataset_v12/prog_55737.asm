; DESCRIPTION: Composite: Places a cyan circle of radius 61 at center (440, 137) then Creates a cyan rectangular region at (131, 163) spanning 108 by 35 pixels then Places a cyan line segment connecting (198, 165) to (444, 57).
; PLAN: r0=440(x), r1=137(y), r2=61(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=131(x), r6=163(y), r7=108(width), r8=35(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x1), r11=165(y1), r12=444(x2), r13=57(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 137
LDI r2, 61
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 131
LDI r6, 163
LDI r7, 108
LDI r8, 35
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 165
LDI r12, 444
LDI r13, 57
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
