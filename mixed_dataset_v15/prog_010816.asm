; DESCRIPTION: Composite: Renders a cyan box of size 83x47 starting at (218, 207) then Places a red line segment connecting (189, 141) to (246, 138) then Places a blue circle of radius 34 at center (217, 123).
; PLAN: r0=218(x), r1=207(y), r2=83(width), r3=47(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x1), r6=141(y1), r7=246(x2), r8=138(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=217(x), r11=123(y), r12=34(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 218
LDI r1, 207
LDI r2, 83
LDI r3, 47
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 141
LDI r7, 246
LDI r8, 138
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 123
LDI r12, 34
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
