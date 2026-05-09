; DESCRIPTION: Composite: Renders a yellow line between points (451, 27) and (469, 137) then Renders a cyan disk with center (293, 175) and radius 28 then Renders a black box of size 26x108 starting at (150, 101).
; PLAN: r0=451(x1), r1=27(y1), r2=469(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=293(x), r6=175(y), r7=28(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=150(x), r11=101(y), r12=26(width), r13=108(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 451
LDI r1, 27
LDI r2, 469
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 293
LDI r6, 175
LDI r7, 28
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 150
LDI r11, 101
LDI r12, 26
LDI r13, 108
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
