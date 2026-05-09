; DESCRIPTION: Composite: Sets a single purple pixel at (148, 246) then Renders a purple box of size 118x53 starting at (10, 26) then Places a white line segment connecting (97, 138) to (201, 96).
; PLAN: r0=148(x), r1=246(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=10(x), r6=26(y), r7=118(width), r8=53(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=97(x1), r11=138(y1), r12=201(x2), r13=96(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 148
LDI r1, 246
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 10
LDI r6, 26
LDI r7, 118
LDI r8, 53
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 97
LDI r11, 138
LDI r12, 201
LDI r13, 96
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
