; DESCRIPTION: Composite: Renders a red disk with center (101, 168) and radius 20 then Draws a green rectangle at (401, 33) with width 64 and height 102 then Places a green line segment connecting (414, 68) to (264, 152).
; PLAN: r0=101(x), r1=168(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=401(x), r6=33(y), r7=64(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=414(x1), r11=68(y1), r12=264(x2), r13=152(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 101
LDI r1, 168
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 401
LDI r6, 33
LDI r7, 64
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 414
LDI r11, 68
LDI r12, 264
LDI r13, 152
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
