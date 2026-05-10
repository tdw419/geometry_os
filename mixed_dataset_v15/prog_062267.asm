; DESCRIPTION: Composite: Draws a white line from (381, 174) to (349, 96) then Renders a cyan box of size 22x20 starting at (310, 197) then Renders a magenta disk with center (65, 101) and radius 33.
; PLAN: r0=381(x1), r1=174(y1), r2=349(x2), r3=96(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=197(y), r7=22(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=65(x), r11=101(y), r12=33(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 381
LDI r1, 174
LDI r2, 349
LDI r3, 96
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 197
LDI r7, 22
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 65
LDI r11, 101
LDI r12, 33
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
