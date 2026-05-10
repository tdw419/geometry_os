; DESCRIPTION: Composite: Renders a magenta box of size 40x75 starting at (315, 60) then Draws a cyan circle centered at (191, 170) with radius 23 then Renders a purple line between points (468, 242) and (289, 225).
; PLAN: r0=315(x), r1=60(y), r2=40(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=170(y), r7=23(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=468(x1), r11=242(y1), r12=289(x2), r13=225(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 60
LDI r2, 40
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 170
LDI r7, 23
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 468
LDI r11, 242
LDI r12, 289
LDI r13, 225
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
