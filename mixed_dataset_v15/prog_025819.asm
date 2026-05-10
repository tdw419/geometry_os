; DESCRIPTION: Composite: Creates a black rectangular region at (466, 48) spanning 19 by 28 pixels then Places a green line segment connecting (495, 1) to (382, 79).
; PLAN: r0=466(x), r1=48(y), r2=19(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=495(x1), r6=1(y1), r7=382(x2), r8=79(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 466
LDI r1, 48
LDI r2, 19
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 495
LDI r6, 1
LDI r7, 382
LDI r8, 79
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
