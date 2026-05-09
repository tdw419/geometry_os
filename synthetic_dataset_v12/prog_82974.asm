; DESCRIPTION: Composite: Places a yellow dot at position (323, 103) then Draws a blue rectangle at (428, 105) with width 13 and height 92 then Creates a yellow circular shape at (406, 94) with radius 29.
; PLAN: r0=323(x), r1=103(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=428(x), r6=105(y), r7=13(width), r8=92(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=406(x), r11=94(y), r12=29(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 323
LDI r1, 103
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 428
LDI r6, 105
LDI r7, 13
LDI r8, 92
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 94
LDI r12, 29
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
