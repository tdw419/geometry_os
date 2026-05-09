; DESCRIPTION: Composite: Places a yellow line segment connecting (287, 50) to (410, 188) then Places a green circle of radius 32 at center (175, 69) then Sets a single white pixel at (379, 36).
; PLAN: r0=287(x1), r1=50(y1), r2=410(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=69(y), r7=32(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=379(x), r11=36(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 287
LDI r1, 50
LDI r2, 410
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 69
LDI r7, 32
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 379
LDI r11, 36
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
