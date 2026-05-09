; DESCRIPTION: Composite: Places a white circle of radius 34 at center (48, 137) then Renders a black line between points (126, 221) and (210, 38) then Renders a white box of size 43x13 starting at (314, 225).
; PLAN: r0=48(x), r1=137(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x1), r6=221(y1), r7=210(x2), r8=38(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=314(x), r11=225(y), r12=43(width), r13=13(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 48
LDI r1, 137
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 221
LDI r7, 210
LDI r8, 38
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 314
LDI r11, 225
LDI r12, 43
LDI r13, 13
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
