; DESCRIPTION: Composite: Renders a black box of size 30x66 starting at (46, 107) then Places a red circle of radius 57 at center (440, 143) then Places a cyan line segment connecting (363, 12) to (383, 148).
; PLAN: r0=46(x), r1=107(y), r2=30(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=440(x), r6=143(y), r7=57(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x1), r11=12(y1), r12=383(x2), r13=148(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 46
LDI r1, 107
LDI r2, 30
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 143
LDI r7, 57
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 12
LDI r12, 383
LDI r13, 148
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
