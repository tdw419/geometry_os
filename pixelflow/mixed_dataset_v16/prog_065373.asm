; DESCRIPTION: Composite: Renders a black disk with center (466, 31) and radius 25 then Places a green 19x102 rectangle at position (244, 3) then Places a green line segment connecting (54, 207) to (327, 190).
; PLAN: r0=466(x), r1=31(y), r2=25(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=244(x), r6=3(y), r7=19(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=54(x1), r11=207(y1), r12=327(x2), r13=190(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 31
LDI r2, 25
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 244
LDI r6, 3
LDI r7, 19
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 54
LDI r11, 207
LDI r12, 327
LDI r13, 190
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
