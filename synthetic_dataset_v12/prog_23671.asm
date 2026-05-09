; DESCRIPTION: Composite: Sets a single blue pixel at (255, 47) then Draws a green line from (359, 54) to (422, 102) then Places a white circle of radius 40 at center (435, 163).
; PLAN: r0=255(x), r1=47(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=359(x1), r6=54(y1), r7=422(x2), r8=102(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=435(x), r11=163(y), r12=40(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 255
LDI r1, 47
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 359
LDI r6, 54
LDI r7, 422
LDI r8, 102
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 435
LDI r11, 163
LDI r12, 40
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
