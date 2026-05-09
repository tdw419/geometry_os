; DESCRIPTION: Composite: Renders a white box of size 53x101 starting at (92, 62) then Places a yellow dot at position (368, 157) then Draws a black line from (275, 23) to (176, 39).
; PLAN: r0=92(x), r1=62(y), r2=53(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=157(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=275(x1), r11=23(y1), r12=176(x2), r13=39(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 92
LDI r1, 62
LDI r2, 53
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 157
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 275
LDI r11, 23
LDI r12, 176
LDI r13, 39
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
