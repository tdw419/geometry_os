; DESCRIPTION: Composite: Renders a white box of size 32x10 starting at (230, 163) then Places a yellow dot at position (313, 71) then Draws a cyan line from (227, 136) to (235, 94).
; PLAN: r0=230(x), r1=163(y), r2=32(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=313(x), r6=71(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=227(x1), r11=136(y1), r12=235(x2), r13=94(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 230
LDI r1, 163
LDI r2, 32
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 313
LDI r6, 71
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 227
LDI r11, 136
LDI r12, 235
LDI r13, 94
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
