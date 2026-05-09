; DESCRIPTION: Composite: Draws a black line from (460, 116) to (135, 163) then Draws a blue circle centered at (372, 101) with radius 57 then Places a yellow dot at position (60, 73).
; PLAN: r0=460(x1), r1=116(y1), r2=135(x2), r3=163(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=372(x), r6=101(y), r7=57(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x), r11=73(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 460
LDI r1, 116
LDI r2, 135
LDI r3, 163
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 101
LDI r7, 57
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 73
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
