; DESCRIPTION: Composite: Renders a orange box of size 47x88 starting at (157, 132) then Renders a red disk with center (303, 65) and radius 45 then Renders a black line between points (157, 108) and (212, 150).
; PLAN: r0=157(x), r1=132(y), r2=47(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=65(y), r7=45(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=157(x1), r11=108(y1), r12=212(x2), r13=150(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 157
LDI r1, 132
LDI r2, 47
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 65
LDI r7, 45
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 157
LDI r11, 108
LDI r12, 212
LDI r13, 150
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
