; DESCRIPTION: Composite: Creates a blue rectangular region at (281, 175) spanning 59 by 26 pixels then Places a purple dot at position (52, 234) then Draws a cyan line from (402, 240) to (507, 156).
; PLAN: r0=281(x), r1=175(y), r2=59(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=52(x), r6=234(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=402(x1), r11=240(y1), r12=507(x2), r13=156(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 175
LDI r2, 59
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 234
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 402
LDI r11, 240
LDI r12, 507
LDI r13, 156
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
