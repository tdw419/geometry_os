; DESCRIPTION: Composite: Draws a black circle centered at (94, 59) with radius 59 then Creates a cyan rectangular region at (98, 21) spanning 16 by 24 pixels then Places a blue line segment connecting (164, 4) to (385, 174).
; PLAN: r0=94(x), r1=59(y), r2=59(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x), r6=21(y), r7=16(width), r8=24(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=164(x1), r11=4(y1), r12=385(x2), r13=174(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 94
LDI r1, 59
LDI r2, 59
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 21
LDI r7, 16
LDI r8, 24
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 164
LDI r11, 4
LDI r12, 385
LDI r13, 174
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
