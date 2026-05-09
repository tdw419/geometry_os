; DESCRIPTION: Composite: Places a orange circle of radius 10 at center (70, 103) then Renders a green box of size 78x39 starting at (355, 200) then Draws a black line from (46, 152) to (208, 55).
; PLAN: r0=70(x), r1=103(y), r2=10(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=355(x), r6=200(y), r7=78(width), r8=39(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=46(x1), r11=152(y1), r12=208(x2), r13=55(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 70
LDI r1, 103
LDI r2, 10
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 355
LDI r6, 200
LDI r7, 78
LDI r8, 39
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 46
LDI r11, 152
LDI r12, 208
LDI r13, 55
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
