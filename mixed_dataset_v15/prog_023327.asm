; DESCRIPTION: Composite: Places a black dot at position (395, 250) then Places a orange line segment connecting (70, 184) to (369, 58) then Places a magenta 34x28 rectangle at position (401, 224).
; PLAN: r0=395(x), r1=250(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=70(x1), r6=184(y1), r7=369(x2), r8=58(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=401(x), r11=224(y), r12=34(width), r13=28(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 395
LDI r1, 250
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 70
LDI r6, 184
LDI r7, 369
LDI r8, 58
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 224
LDI r12, 34
LDI r13, 28
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
