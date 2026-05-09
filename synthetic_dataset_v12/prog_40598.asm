; DESCRIPTION: Composite: Renders a orange line between points (415, 211) and (302, 28) then Renders a blue disk with center (230, 44) and radius 23 then Places a magenta 87x80 rectangle at position (409, 23).
; PLAN: r0=415(x1), r1=211(y1), r2=302(x2), r3=28(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=230(x), r6=44(y), r7=23(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=409(x), r11=23(y), r12=87(width), r13=80(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 211
LDI r2, 302
LDI r3, 28
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 230
LDI r6, 44
LDI r7, 23
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 409
LDI r11, 23
LDI r12, 87
LDI r13, 80
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
