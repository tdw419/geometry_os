; DESCRIPTION: Composite: Places a white dot at position (431, 108) then Places a red line segment connecting (230, 126) to (353, 139) then Draws a white circle centered at (123, 93) with radius 64.
; PLAN: r0=431(x), r1=108(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=230(x1), r6=126(y1), r7=353(x2), r8=139(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=123(x), r11=93(y), r12=64(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 431
LDI r1, 108
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 230
LDI r6, 126
LDI r7, 353
LDI r8, 139
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 93
LDI r12, 64
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
