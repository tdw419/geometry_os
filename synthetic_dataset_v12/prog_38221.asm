; DESCRIPTION: Composite: Renders a yellow line between points (2, 249) and (80, 60) then Renders a green box of size 102x41 starting at (355, 29) then Renders a orange disk with center (387, 107) and radius 46.
; PLAN: r0=2(x1), r1=249(y1), r2=80(x2), r3=60(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=29(y), r7=102(width), r8=41(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=387(x), r11=107(y), r12=46(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 2
LDI r1, 249
LDI r2, 80
LDI r3, 60
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 29
LDI r7, 102
LDI r8, 41
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 107
LDI r12, 46
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
