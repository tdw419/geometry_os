; DESCRIPTION: Composite: Renders a green box of size 25x18 starting at (308, 99) then Sets a single black pixel at (35, 173) then Places a green circle of radius 26 at center (469, 198).
; PLAN: r0=308(x), r1=99(y), r2=25(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=35(x), r6=173(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=469(x), r11=198(y), r12=26(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 308
LDI r1, 99
LDI r2, 25
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 173
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 469
LDI r11, 198
LDI r12, 26
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
