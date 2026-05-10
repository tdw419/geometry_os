; DESCRIPTION: Composite: Renders a orange box of size 66x105 starting at (31, 50) then Draws a green line from (448, 115) to (173, 129) then Renders a yellow disk with center (175, 117) and radius 76.
; PLAN: r0=31(x), r1=50(y), r2=66(width), r3=105(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x1), r6=115(y1), r7=173(x2), r8=129(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=175(x), r11=117(y), r12=76(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 50
LDI r2, 66
LDI r3, 105
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 115
LDI r7, 173
LDI r8, 129
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 175
LDI r11, 117
LDI r12, 76
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
