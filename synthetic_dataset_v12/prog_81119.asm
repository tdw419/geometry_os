; DESCRIPTION: Composite: Places a red dot at position (347, 132) then Renders a black box of size 61x44 starting at (29, 190) then Renders a purple line between points (152, 16) and (317, 176).
; PLAN: r0=347(x), r1=132(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=29(x), r6=190(y), r7=61(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=152(x1), r11=16(y1), r12=317(x2), r13=176(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 347
LDI r1, 132
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 29
LDI r6, 190
LDI r7, 61
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 152
LDI r11, 16
LDI r12, 317
LDI r13, 176
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
