; DESCRIPTION: Composite: Draws a magenta circle centered at (210, 221) with radius 28 then Sets a single black pixel at (49, 237) then Draws a black line from (304, 148) to (154, 62).
; PLAN: r0=210(x), r1=221(y), r2=28(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=49(x), r6=237(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=304(x1), r11=148(y1), r12=154(x2), r13=62(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 210
LDI r1, 221
LDI r2, 28
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 49
LDI r6, 237
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 304
LDI r11, 148
LDI r12, 154
LDI r13, 62
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
