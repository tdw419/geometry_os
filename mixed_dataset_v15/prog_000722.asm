; DESCRIPTION: Composite: Places a black dot at position (265, 17) then Draws a magenta circle centered at (469, 124) with radius 41 then Renders a black line between points (192, 133) and (365, 6).
; PLAN: r0=265(x), r1=17(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=469(x), r6=124(y), r7=41(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=192(x1), r11=133(y1), r12=365(x2), r13=6(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 265
LDI r1, 17
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 469
LDI r6, 124
LDI r7, 41
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 192
LDI r11, 133
LDI r12, 365
LDI r13, 6
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
