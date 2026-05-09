; DESCRIPTION: Composite: Places a black line segment connecting (44, 139) to (29, 248) then Draws a white rectangle at (103, 204) with width 40 and height 19 then Draws a magenta circle centered at (169, 30) with radius 27.
; PLAN: r0=44(x1), r1=139(y1), r2=29(x2), r3=248(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=103(x), r6=204(y), r7=40(width), r8=19(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=169(x), r11=30(y), r12=27(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 44
LDI r1, 139
LDI r2, 29
LDI r3, 248
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 103
LDI r6, 204
LDI r7, 40
LDI r8, 19
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 169
LDI r11, 30
LDI r12, 27
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
