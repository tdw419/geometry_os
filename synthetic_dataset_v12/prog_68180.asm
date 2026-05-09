; DESCRIPTION: Composite: Places a yellow line segment connecting (65, 20) to (325, 226) then Draws a black rectangle at (10, 83) with width 28 and height 12.
; PLAN: r0=65(x1), r1=20(y1), r2=325(x2), r3=226(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=10(x), r6=83(y), r7=28(width), r8=12(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 65
LDI r1, 20
LDI r2, 325
LDI r3, 226
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 83
LDI r7, 28
LDI r8, 12
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
