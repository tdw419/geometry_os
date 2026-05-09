; DESCRIPTION: Composite: Renders a black line between points (366, 69) and (495, 2) then Renders a green box of size 116x112 starting at (224, 95) then Sets a single green pixel at (378, 120).
; PLAN: r0=366(x1), r1=69(y1), r2=495(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=224(x), r6=95(y), r7=116(width), r8=112(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=378(x), r11=120(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 366
LDI r1, 69
LDI r2, 495
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 224
LDI r6, 95
LDI r7, 116
LDI r8, 112
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 378
LDI r11, 120
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
