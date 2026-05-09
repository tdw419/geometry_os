; DESCRIPTION: Composite: Draws a yellow rectangle at (312, 5) with width 45 and height 91 then Places a green dot at position (390, 167) then Draws a cyan line from (294, 102) to (493, 212).
; PLAN: r0=312(x), r1=5(y), r2=45(width), r3=91(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=167(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=294(x1), r11=102(y1), r12=493(x2), r13=212(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 312
LDI r1, 5
LDI r2, 45
LDI r3, 91
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 167
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 294
LDI r11, 102
LDI r12, 493
LDI r13, 212
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
