; DESCRIPTION: Composite: Draws a red circle centered at (385, 19) with radius 13 then Renders a cyan line between points (83, 212) and (394, 187) then Renders a purple box of size 62x11 starting at (91, 175).
; PLAN: r0=385(x), r1=19(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=83(x1), r6=212(y1), r7=394(x2), r8=187(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=91(x), r11=175(y), r12=62(width), r13=11(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 385
LDI r1, 19
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 83
LDI r6, 212
LDI r7, 394
LDI r8, 187
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 91
LDI r11, 175
LDI r12, 62
LDI r13, 11
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
