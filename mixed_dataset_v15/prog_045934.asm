; DESCRIPTION: Composite: Renders a orange box of size 26x78 starting at (13, 25) then Places a blue dot at position (185, 203) then Draws a cyan line from (121, 15) to (21, 3).
; PLAN: r0=13(x), r1=25(y), r2=26(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=185(x), r6=203(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=121(x1), r11=15(y1), r12=21(x2), r13=3(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 25
LDI r2, 26
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 185
LDI r6, 203
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 121
LDI r11, 15
LDI r12, 21
LDI r13, 3
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
