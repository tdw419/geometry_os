; DESCRIPTION: Composite: Places a red line segment connecting (239, 216) to (351, 115) then Places a green dot at position (346, 150) then Draws a cyan circle centered at (112, 44) with radius 23.
; PLAN: r0=239(x1), r1=216(y1), r2=351(x2), r3=115(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=150(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=112(x), r11=44(y), r12=23(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 239
LDI r1, 216
LDI r2, 351
LDI r3, 115
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 150
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 112
LDI r11, 44
LDI r12, 23
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
