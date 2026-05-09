; DESCRIPTION: Composite: Creates a orange circular shape at (214, 214) with radius 34 then Renders a yellow box of size 14x99 starting at (376, 22) then Renders a black line between points (298, 36) and (302, 68).
; PLAN: r0=214(x), r1=214(y), r2=34(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x), r6=22(y), r7=14(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=298(x1), r11=36(y1), r12=302(x2), r13=68(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 214
LDI r2, 34
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 22
LDI r7, 14
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 298
LDI r11, 36
LDI r12, 302
LDI r13, 68
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
