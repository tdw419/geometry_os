; DESCRIPTION: Composite: Places a yellow line segment connecting (114, 113) to (175, 147) then Renders a orange box of size 43x19 starting at (123, 128).
; PLAN: r0=114(x1), r1=113(y1), r2=175(x2), r3=147(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=123(x), r6=128(y), r7=43(width), r8=19(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 114
LDI r1, 113
LDI r2, 175
LDI r3, 147
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 123
LDI r6, 128
LDI r7, 43
LDI r8, 19
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
