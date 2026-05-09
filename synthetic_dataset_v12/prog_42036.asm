; DESCRIPTION: Composite: Creates a blue rectangular region at (150, 182) spanning 43 by 23 pixels then Places a black line segment connecting (394, 24) to (259, 137).
; PLAN: r0=150(x), r1=182(y), r2=43(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=394(x1), r6=24(y1), r7=259(x2), r8=137(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 150
LDI r1, 182
LDI r2, 43
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 394
LDI r6, 24
LDI r7, 259
LDI r8, 137
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
