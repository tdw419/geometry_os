; DESCRIPTION: Composite: Places a orange circle of radius 45 at center (240, 81) then Renders a black box of size 110x41 starting at (228, 169) then Draws a yellow line from (14, 14) to (335, 220).
; PLAN: r0=240(x), r1=81(y), r2=45(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=169(y), r7=110(width), r8=41(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=14(x1), r11=14(y1), r12=335(x2), r13=220(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 240
LDI r1, 81
LDI r2, 45
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 169
LDI r7, 110
LDI r8, 41
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 14
LDI r11, 14
LDI r12, 335
LDI r13, 220
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
