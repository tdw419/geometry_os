; DESCRIPTION: Composite: Places a red dot at position (210, 255) then Places a white circle of radius 44 at center (319, 191) then Draws a magenta line from (41, 232) to (134, 157).
; PLAN: r0=210(x), r1=255(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=319(x), r6=191(y), r7=44(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=41(x1), r11=232(y1), r12=134(x2), r13=157(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 255
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 319
LDI r6, 191
LDI r7, 44
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 41
LDI r11, 232
LDI r12, 134
LDI r13, 157
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
