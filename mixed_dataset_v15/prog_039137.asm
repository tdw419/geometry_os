; DESCRIPTION: Composite: Renders a orange disk with center (359, 51) and radius 18 then Renders a blue line between points (457, 236) and (157, 141) then Renders a black box of size 103x46 starting at (49, 190).
; PLAN: r0=359(x), r1=51(y), r2=18(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=457(x1), r6=236(y1), r7=157(x2), r8=141(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=49(x), r11=190(y), r12=103(width), r13=46(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 359
LDI r1, 51
LDI r2, 18
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 457
LDI r6, 236
LDI r7, 157
LDI r8, 141
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 190
LDI r12, 103
LDI r13, 46
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
