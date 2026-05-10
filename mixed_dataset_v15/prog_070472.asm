; DESCRIPTION: Composite: Renders a red line between points (287, 159) and (431, 144) then Draws a cyan circle centered at (153, 151) with radius 72 then Renders a white box of size 16x47 starting at (363, 34).
; PLAN: r0=287(x1), r1=159(y1), r2=431(x2), r3=144(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=153(x), r6=151(y), r7=72(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x), r11=34(y), r12=16(width), r13=47(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 159
LDI r2, 431
LDI r3, 144
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 153
LDI r6, 151
LDI r7, 72
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 34
LDI r12, 16
LDI r13, 47
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
