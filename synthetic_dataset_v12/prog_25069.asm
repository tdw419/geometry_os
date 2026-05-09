; DESCRIPTION: Composite: Creates a yellow circular shape at (421, 150) with radius 25 then Draws a black line from (371, 130) to (389, 32) then Draws a orange rectangle at (371, 131) with width 98 and height 106.
; PLAN: r0=421(x), r1=150(y), r2=25(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=371(x1), r6=130(y1), r7=389(x2), r8=32(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=371(x), r11=131(y), r12=98(width), r13=106(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 150
LDI r2, 25
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 371
LDI r6, 130
LDI r7, 389
LDI r8, 32
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 131
LDI r12, 98
LDI r13, 106
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
