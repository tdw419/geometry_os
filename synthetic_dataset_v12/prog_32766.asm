; DESCRIPTION: Composite: Draws a black circle centered at (376, 135) with radius 46 then Renders a white box of size 81x48 starting at (243, 128) then Draws a cyan line from (236, 170) to (134, 99).
; PLAN: r0=376(x), r1=135(y), r2=46(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=128(y), r7=81(width), r8=48(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=236(x1), r11=170(y1), r12=134(x2), r13=99(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 376
LDI r1, 135
LDI r2, 46
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 128
LDI r7, 81
LDI r8, 48
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 236
LDI r11, 170
LDI r12, 134
LDI r13, 99
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
