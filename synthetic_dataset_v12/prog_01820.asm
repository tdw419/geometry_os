; DESCRIPTION: Composite: Draws a magenta rectangle at (283, 121) with width 56 and height 119 then Renders a green line between points (148, 220) and (370, 255) then Places a orange circle of radius 47 at center (221, 204).
; PLAN: r0=283(x), r1=121(y), r2=56(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=148(x1), r6=220(y1), r7=370(x2), r8=255(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=204(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 283
LDI r1, 121
LDI r2, 56
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 220
LDI r7, 370
LDI r8, 255
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 204
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
