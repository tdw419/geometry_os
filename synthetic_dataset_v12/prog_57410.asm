; DESCRIPTION: Composite: Draws a blue circle centered at (275, 95) with radius 53 then Draws a red line from (444, 51) to (26, 122) then Renders a orange box of size 117x18 starting at (202, 133).
; PLAN: r0=275(x), r1=95(y), r2=53(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=444(x1), r6=51(y1), r7=26(x2), r8=122(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=202(x), r11=133(y), r12=117(width), r13=18(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 275
LDI r1, 95
LDI r2, 53
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 444
LDI r6, 51
LDI r7, 26
LDI r8, 122
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 202
LDI r11, 133
LDI r12, 117
LDI r13, 18
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
