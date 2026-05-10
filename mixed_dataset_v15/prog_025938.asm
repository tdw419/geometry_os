; DESCRIPTION: Composite: Places a red dot at position (349, 31) then Places a black line segment connecting (56, 246) to (443, 95) then Renders a black box of size 108x24 starting at (128, 17).
; PLAN: r0=349(x), r1=31(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=56(x1), r6=246(y1), r7=443(x2), r8=95(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=128(x), r11=17(y), r12=108(width), r13=24(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 349
LDI r1, 31
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 56
LDI r6, 246
LDI r7, 443
LDI r8, 95
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 128
LDI r11, 17
LDI r12, 108
LDI r13, 24
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
