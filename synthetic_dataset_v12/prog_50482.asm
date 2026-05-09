; DESCRIPTION: Composite: Places a red dot at position (255, 212) then Renders a black box of size 94x107 starting at (17, 9) then Places a cyan line segment connecting (287, 240) to (289, 240).
; PLAN: r0=255(x), r1=212(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=17(x), r6=9(y), r7=94(width), r8=107(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=287(x1), r11=240(y1), r12=289(x2), r13=240(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 212
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 17
LDI r6, 9
LDI r7, 94
LDI r8, 107
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 287
LDI r11, 240
LDI r12, 289
LDI r13, 240
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
