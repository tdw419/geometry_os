; DESCRIPTION: Composite: Draws a green line from (190, 107) to (307, 52) then Places a purple circle of radius 21 at center (240, 220) then Creates a white rectangular region at (26, 120) spanning 36 by 68 pixels.
; PLAN: r0=190(x1), r1=107(y1), r2=307(x2), r3=52(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=240(x), r6=220(y), r7=21(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=26(x), r11=120(y), r12=36(width), r13=68(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 107
LDI r2, 307
LDI r3, 52
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 240
LDI r6, 220
LDI r7, 21
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 26
LDI r11, 120
LDI r12, 36
LDI r13, 68
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
