; DESCRIPTION: Composite: Renders a cyan line between points (446, 144) and (197, 163) then Sets a single green pixel at (82, 194) then Draws a purple rectangle at (223, 84) with width 102 and height 69.
; PLAN: r0=446(x1), r1=144(y1), r2=197(x2), r3=163(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=82(x), r6=194(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=84(y), r12=102(width), r13=69(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 446
LDI r1, 144
LDI r2, 197
LDI r3, 163
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 82
LDI r6, 194
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 223
LDI r11, 84
LDI r12, 102
LDI r13, 69
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
