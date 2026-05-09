; DESCRIPTION: Composite: Renders a orange box of size 20x62 starting at (398, 107) then Places a yellow line segment connecting (53, 209) to (256, 115) then Renders a yellow disk with center (488, 143) and radius 11.
; PLAN: r0=398(x), r1=107(y), r2=20(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=53(x1), r6=209(y1), r7=256(x2), r8=115(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=488(x), r11=143(y), r12=11(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 398
LDI r1, 107
LDI r2, 20
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 53
LDI r6, 209
LDI r7, 256
LDI r8, 115
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 143
LDI r12, 11
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
