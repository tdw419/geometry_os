; DESCRIPTION: Composite: Renders a blue box of size 119x80 starting at (235, 1) then Creates a black circular shape at (140, 72) with radius 60 then Renders a cyan line between points (139, 209) and (23, 102).
; PLAN: r0=235(x), r1=1(y), r2=119(width), r3=80(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=140(x), r6=72(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=139(x1), r11=209(y1), r12=23(x2), r13=102(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 235
LDI r1, 1
LDI r2, 119
LDI r3, 80
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 140
LDI r6, 72
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 139
LDI r11, 209
LDI r12, 23
LDI r13, 102
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
