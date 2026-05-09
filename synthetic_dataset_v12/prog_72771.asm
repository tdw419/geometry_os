; DESCRIPTION: Composite: Places a orange circle of radius 25 at center (227, 50) then Creates a black rectangular region at (46, 89) spanning 74 by 20 pixels then Draws a green line from (228, 171) to (96, 249).
; PLAN: r0=227(x), r1=50(y), r2=25(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=46(x), r6=89(y), r7=74(width), r8=20(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x1), r11=171(y1), r12=96(x2), r13=249(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 227
LDI r1, 50
LDI r2, 25
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 46
LDI r6, 89
LDI r7, 74
LDI r8, 20
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 171
LDI r12, 96
LDI r13, 249
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
