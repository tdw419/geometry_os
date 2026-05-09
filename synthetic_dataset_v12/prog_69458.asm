; DESCRIPTION: Composite: Draws a blue rectangle at (286, 217) with width 98 and height 37 then Renders a black line between points (454, 11) and (92, 159) then Places a white circle of radius 59 at center (327, 165).
; PLAN: r0=286(x), r1=217(y), r2=98(width), r3=37(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=11(y1), r7=92(x2), r8=159(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=327(x), r11=165(y), r12=59(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 286
LDI r1, 217
LDI r2, 98
LDI r3, 37
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 11
LDI r7, 92
LDI r8, 159
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 327
LDI r11, 165
LDI r12, 59
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
