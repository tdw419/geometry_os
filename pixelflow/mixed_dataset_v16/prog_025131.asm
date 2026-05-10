; DESCRIPTION: Composite: Renders a black box of size 95x90 starting at (315, 147) then Places a magenta line segment connecting (285, 230) to (323, 149) then Places a black dot at position (320, 131).
; PLAN: r0=315(x), r1=147(y), r2=95(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=285(x1), r6=230(y1), r7=323(x2), r8=149(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=320(x), r11=131(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 315
LDI r1, 147
LDI r2, 95
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 285
LDI r6, 230
LDI r7, 323
LDI r8, 149
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 320
LDI r11, 131
LDI r12, 0x000000
PSET r10, r11, r12
HALT
