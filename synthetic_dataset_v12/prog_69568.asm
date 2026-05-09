; DESCRIPTION: Composite: Renders a green line between points (155, 79) and (423, 79) then Renders a black box of size 62x95 starting at (234, 39) then Places a yellow dot at position (123, 37).
; PLAN: r0=155(x1), r1=79(y1), r2=423(x2), r3=79(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=39(y), r7=62(width), r8=95(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=123(x), r11=37(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 155
LDI r1, 79
LDI r2, 423
LDI r3, 79
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 39
LDI r7, 62
LDI r8, 95
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 123
LDI r11, 37
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
