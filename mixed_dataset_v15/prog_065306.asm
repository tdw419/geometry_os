; DESCRIPTION: Composite: Renders a magenta box of size 41x93 starting at (418, 139) then Renders a black line between points (150, 233) and (412, 43) then Renders a cyan disk with center (184, 101) and radius 64.
; PLAN: r0=418(x), r1=139(y), r2=41(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=233(y1), r7=412(x2), r8=43(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=184(x), r11=101(y), r12=64(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 139
LDI r2, 41
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 233
LDI r7, 412
LDI r8, 43
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 184
LDI r11, 101
LDI r12, 64
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
