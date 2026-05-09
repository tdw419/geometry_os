; DESCRIPTION: Composite: Places a white circle of radius 80 at center (432, 108) then Draws a black line from (487, 32) to (68, 95) then Renders a red box of size 23x23 starting at (400, 121).
; PLAN: r0=432(x), r1=108(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=487(x1), r6=32(y1), r7=68(x2), r8=95(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=400(x), r11=121(y), r12=23(width), r13=23(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 432
LDI r1, 108
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 487
LDI r6, 32
LDI r7, 68
LDI r8, 95
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 400
LDI r11, 121
LDI r12, 23
LDI r13, 23
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
