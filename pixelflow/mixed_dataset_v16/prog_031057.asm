; DESCRIPTION: Composite: Places a red line segment connecting (213, 224) to (236, 40) then Draws a black circle centered at (388, 88) with radius 61 then Places a blue dot at position (59, 170).
; PLAN: r0=213(x1), r1=224(y1), r2=236(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=388(x), r6=88(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=59(x), r11=170(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 213
LDI r1, 224
LDI r2, 236
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 388
LDI r6, 88
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 59
LDI r11, 170
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
