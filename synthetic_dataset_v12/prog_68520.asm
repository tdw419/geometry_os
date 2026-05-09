; DESCRIPTION: Composite: Sets a single magenta pixel at (233, 191) then Draws a purple circle centered at (288, 184) with radius 28 then Draws a white line from (175, 50) to (258, 216).
; PLAN: r0=233(x), r1=191(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=288(x), r6=184(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x1), r11=50(y1), r12=258(x2), r13=216(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 191
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 288
LDI r6, 184
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 50
LDI r12, 258
LDI r13, 216
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
