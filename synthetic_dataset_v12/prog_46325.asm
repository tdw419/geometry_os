; DESCRIPTION: Composite: Sets a single white pixel at (446, 237) then Creates a black rectangular region at (435, 73) spanning 21 by 115 pixels then Places a blue line segment connecting (85, 246) to (190, 117).
; PLAN: r0=446(x), r1=237(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=435(x), r6=73(y), r7=21(width), r8=115(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=85(x1), r11=246(y1), r12=190(x2), r13=117(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 237
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 435
LDI r6, 73
LDI r7, 21
LDI r8, 115
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 85
LDI r11, 246
LDI r12, 190
LDI r13, 117
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
