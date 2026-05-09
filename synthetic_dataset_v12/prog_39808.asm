; DESCRIPTION: Composite: Places a magenta dot at position (383, 245) then Draws a blue circle centered at (466, 59) with radius 29 then Places a white line segment connecting (506, 58) to (35, 70).
; PLAN: r0=383(x), r1=245(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=466(x), r6=59(y), r7=29(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=506(x1), r11=58(y1), r12=35(x2), r13=70(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 245
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 466
LDI r6, 59
LDI r7, 29
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 506
LDI r11, 58
LDI r12, 35
LDI r13, 70
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
