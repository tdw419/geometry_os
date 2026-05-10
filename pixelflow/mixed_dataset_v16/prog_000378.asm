; DESCRIPTION: Composite: Renders a black line between points (505, 129) and (131, 224) then Draws a yellow rectangle at (291, 56) with width 106 and height 43.
; PLAN: r0=505(x1), r1=129(y1), r2=131(x2), r3=224(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=291(x), r6=56(y), r7=106(width), r8=43(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 505
LDI r1, 129
LDI r2, 131
LDI r3, 224
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 56
LDI r7, 106
LDI r8, 43
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
