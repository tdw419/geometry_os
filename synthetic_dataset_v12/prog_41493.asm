; DESCRIPTION: Composite: Renders a red disk with center (465, 43) and radius 21 then Sets a single purple pixel at (143, 223) then Creates a purple rectangular region at (118, 200) spanning 89 by 50 pixels.
; PLAN: r0=465(x), r1=43(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x), r6=223(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=118(x), r11=200(y), r12=89(width), r13=50(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 465
LDI r1, 43
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 223
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 118
LDI r11, 200
LDI r12, 89
LDI r13, 50
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
