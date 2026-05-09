; DESCRIPTION: Composite: Places a orange circle of radius 12 at center (360, 30) then Sets a single white pixel at (54, 112) then Places a red 22x91 rectangle at position (296, 106).
; PLAN: r0=360(x), r1=30(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=112(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=296(x), r11=106(y), r12=22(width), r13=91(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 360
LDI r1, 30
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 112
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 296
LDI r11, 106
LDI r12, 22
LDI r13, 91
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
