; DESCRIPTION: Composite: Places a green dot at position (305, 227) then Creates a blue circular shape at (149, 185) with radius 54 then Draws a blue rectangle at (284, 108) with width 120 and height 15.
; PLAN: r0=305(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=149(x), r6=185(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=108(y), r12=120(width), r13=15(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 305
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 149
LDI r6, 185
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 108
LDI r12, 120
LDI r13, 15
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
