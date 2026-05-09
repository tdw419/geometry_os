; DESCRIPTION: Composite: Draws a yellow circle centered at (70, 95) with radius 62 then Renders a orange line between points (433, 213) and (286, 152) then Renders a cyan box of size 77x35 starting at (323, 88).
; PLAN: r0=70(x), r1=95(y), r2=62(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x1), r6=213(y1), r7=286(x2), r8=152(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=323(x), r11=88(y), r12=77(width), r13=35(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 95
LDI r2, 62
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 213
LDI r7, 286
LDI r8, 152
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 323
LDI r11, 88
LDI r12, 77
LDI r13, 35
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
