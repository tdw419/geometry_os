; DESCRIPTION: Composite: Creates a white rectangular region at (285, 7) spanning 107 by 13 pixels then Renders a cyan line between points (340, 193) and (341, 189) then Creates a cyan circular shape at (410, 83) with radius 16.
; PLAN: r0=285(x), r1=7(y), r2=107(width), r3=13(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=340(x1), r6=193(y1), r7=341(x2), r8=189(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=410(x), r11=83(y), r12=16(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 285
LDI r1, 7
LDI r2, 107
LDI r3, 13
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 193
LDI r7, 341
LDI r8, 189
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 410
LDI r11, 83
LDI r12, 16
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
