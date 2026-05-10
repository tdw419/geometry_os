; DESCRIPTION: Composite: Renders a black line between points (455, 39) and (330, 235) then Draws a black circle centered at (320, 141) with radius 41 then Renders a red box of size 46x77 starting at (281, 22).
; PLAN: r0=455(x1), r1=39(y1), r2=330(x2), r3=235(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=141(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=281(x), r11=22(y), r12=46(width), r13=77(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 455
LDI r1, 39
LDI r2, 330
LDI r3, 235
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 141
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 281
LDI r11, 22
LDI r12, 46
LDI r13, 77
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
