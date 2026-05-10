; DESCRIPTION: Composite: Creates a black rectangular region at (375, 95) spanning 49 by 49 pixels then Places a purple line segment connecting (60, 173) to (84, 28).
; PLAN: r0=375(x), r1=95(y), r2=49(width), r3=49(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x1), r6=173(y1), r7=84(x2), r8=28(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 375
LDI r1, 95
LDI r2, 49
LDI r3, 49
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 173
LDI r7, 84
LDI r8, 28
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
