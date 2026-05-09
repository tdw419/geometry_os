; DESCRIPTION: Composite: Creates a orange circular shape at (386, 174) with radius 70 then Renders a black box of size 31x54 starting at (374, 58) then Places a white line segment connecting (283, 190) to (373, 141).
; PLAN: r0=386(x), r1=174(y), r2=70(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=374(x), r6=58(y), r7=31(width), r8=54(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=283(x1), r11=190(y1), r12=373(x2), r13=141(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 174
LDI r2, 70
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 374
LDI r6, 58
LDI r7, 31
LDI r8, 54
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 283
LDI r11, 190
LDI r12, 373
LDI r13, 141
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
