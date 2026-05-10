; DESCRIPTION: Composite: Renders a red line between points (375, 255) and (403, 219) then Sets a single green pixel at (436, 185) then Renders a red box of size 102x49 starting at (4, 23).
; PLAN: r0=375(x1), r1=255(y1), r2=403(x2), r3=219(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=436(x), r6=185(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=4(x), r11=23(y), r12=102(width), r13=49(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 375
LDI r1, 255
LDI r2, 403
LDI r3, 219
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 436
LDI r6, 185
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 4
LDI r11, 23
LDI r12, 102
LDI r13, 49
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
