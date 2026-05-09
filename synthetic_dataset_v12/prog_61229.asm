; DESCRIPTION: Composite: Places a blue dot at position (171, 124) then Creates a orange circular shape at (15, 238) with radius 10 then Places a red line segment connecting (476, 223) to (337, 151).
; PLAN: r0=171(x), r1=124(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=15(x), r6=238(y), r7=10(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=476(x1), r11=223(y1), r12=337(x2), r13=151(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 171
LDI r1, 124
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 15
LDI r6, 238
LDI r7, 10
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 476
LDI r11, 223
LDI r12, 337
LDI r13, 151
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
