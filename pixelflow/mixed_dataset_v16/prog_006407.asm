; DESCRIPTION: Composite: Renders a yellow line between points (5, 248) and (29, 195) then Places a purple dot at position (61, 96) then Renders a black box of size 54x79 starting at (223, 31).
; PLAN: r0=5(x1), r1=248(y1), r2=29(x2), r3=195(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=61(x), r6=96(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=31(y), r12=54(width), r13=79(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 5
LDI r1, 248
LDI r2, 29
LDI r3, 195
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 61
LDI r6, 96
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 223
LDI r11, 31
LDI r12, 54
LDI r13, 79
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
