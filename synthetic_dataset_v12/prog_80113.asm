; DESCRIPTION: Composite: Sets a single black pixel at (10, 69) then Draws a cyan line from (114, 224) to (260, 147) then Draws a red circle centered at (113, 86) with radius 59.
; PLAN: r0=10(x), r1=69(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=114(x1), r6=224(y1), r7=260(x2), r8=147(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=86(y), r12=59(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 10
LDI r1, 69
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 114
LDI r6, 224
LDI r7, 260
LDI r8, 147
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 86
LDI r12, 59
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
