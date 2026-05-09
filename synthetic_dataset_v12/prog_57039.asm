; DESCRIPTION: Composite: Creates a yellow circular shape at (179, 167) with radius 59 then Sets a single green pixel at (428, 191) then Places a yellow line segment connecting (304, 54) to (344, 204).
; PLAN: r0=179(x), r1=167(y), r2=59(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x), r6=191(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=304(x1), r11=54(y1), r12=344(x2), r13=204(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 167
LDI r2, 59
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 191
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 304
LDI r11, 54
LDI r12, 344
LDI r13, 204
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
