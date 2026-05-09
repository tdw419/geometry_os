; DESCRIPTION: Composite: Renders a blue disk with center (391, 138) and radius 49 then Renders a orange box of size 34x81 starting at (474, 125).
; PLAN: r0=391(x), r1=138(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=125(y), r7=34(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 391
LDI r1, 138
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 125
LDI r7, 34
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
