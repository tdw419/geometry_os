; DESCRIPTION: Composite: Draws a white rectangle at (102, 93) with width 119 and height 48 then Places a white dot at position (378, 3) then Places a green line segment connecting (279, 149) to (398, 62).
; PLAN: r0=102(x), r1=93(y), r2=119(width), r3=48(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=378(x), r6=3(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=279(x1), r11=149(y1), r12=398(x2), r13=62(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 102
LDI r1, 93
LDI r2, 119
LDI r3, 48
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 3
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 279
LDI r11, 149
LDI r12, 398
LDI r13, 62
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
