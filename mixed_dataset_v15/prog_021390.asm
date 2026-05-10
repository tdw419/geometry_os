; DESCRIPTION: Composite: Sets a single magenta pixel at (203, 22) then Draws a white circle centered at (220, 87) with radius 78 then Places a green line segment connecting (193, 59) to (496, 197).
; PLAN: r0=203(x), r1=22(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=220(x), r6=87(y), r7=78(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=193(x1), r11=59(y1), r12=496(x2), r13=197(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 203
LDI r1, 22
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 220
LDI r6, 87
LDI r7, 78
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 193
LDI r11, 59
LDI r12, 496
LDI r13, 197
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
