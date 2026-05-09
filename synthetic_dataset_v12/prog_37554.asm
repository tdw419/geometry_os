; DESCRIPTION: Composite: Creates a yellow circular shape at (304, 122) with radius 49 then Renders a red box of size 38x95 starting at (375, 60) then Places a cyan line segment connecting (232, 48) to (167, 59).
; PLAN: r0=304(x), r1=122(y), r2=49(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=375(x), r6=60(y), r7=38(width), r8=95(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=232(x1), r11=48(y1), r12=167(x2), r13=59(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 304
LDI r1, 122
LDI r2, 49
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 375
LDI r6, 60
LDI r7, 38
LDI r8, 95
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 48
LDI r12, 167
LDI r13, 59
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
