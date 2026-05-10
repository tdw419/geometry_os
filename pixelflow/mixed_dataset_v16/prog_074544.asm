; DESCRIPTION: Composite: Renders a black box of size 119x20 starting at (272, 106) then Sets a single white pixel at (38, 105) then Draws a green line from (211, 142) to (354, 61).
; PLAN: r0=272(x), r1=106(y), r2=119(width), r3=20(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=38(x), r6=105(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=211(x1), r11=142(y1), r12=354(x2), r13=61(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 106
LDI r2, 119
LDI r3, 20
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 38
LDI r6, 105
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 211
LDI r11, 142
LDI r12, 354
LDI r13, 61
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
