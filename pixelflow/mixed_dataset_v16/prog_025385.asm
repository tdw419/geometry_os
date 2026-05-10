; DESCRIPTION: Composite: Renders a white box of size 89x61 starting at (162, 18) then Sets a single orange pixel at (401, 34) then Places a purple line segment connecting (495, 189) to (213, 98).
; PLAN: r0=162(x), r1=18(y), r2=89(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=401(x), r6=34(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=495(x1), r11=189(y1), r12=213(x2), r13=98(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 162
LDI r1, 18
LDI r2, 89
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 401
LDI r6, 34
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 495
LDI r11, 189
LDI r12, 213
LDI r13, 98
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
