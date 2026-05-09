; DESCRIPTION: Composite: Renders a black line between points (182, 73) and (459, 152) then Renders a orange box of size 90x39 starting at (406, 45) then Draws a green circle centered at (128, 56) with radius 53.
; PLAN: r0=182(x1), r1=73(y1), r2=459(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=406(x), r6=45(y), r7=90(width), r8=39(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=128(x), r11=56(y), r12=53(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 182
LDI r1, 73
LDI r2, 459
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 45
LDI r7, 90
LDI r8, 39
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 56
LDI r12, 53
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
