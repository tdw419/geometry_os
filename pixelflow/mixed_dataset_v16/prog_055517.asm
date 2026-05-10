; DESCRIPTION: Composite: Places a red 64x78 rectangle at position (409, 25) then Renders a red line between points (336, 240) and (474, 1) then Sets a single black pixel at (366, 237).
; PLAN: r0=409(x), r1=25(y), r2=64(width), r3=78(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=336(x1), r6=240(y1), r7=474(x2), r8=1(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=237(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 409
LDI r1, 25
LDI r2, 64
LDI r3, 78
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 240
LDI r7, 474
LDI r8, 1
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 237
LDI r12, 0x000000
PSET r10, r11, r12
HALT
