; DESCRIPTION: Composite: Renders a orange box of size 83x14 starting at (49, 57) then Renders a yellow disk with center (81, 142) and radius 58.
; PLAN: r0=49(x), r1=57(y), r2=83(width), r3=14(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=81(x), r6=142(y), r7=58(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 57
LDI r2, 83
LDI r3, 14
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 81
LDI r6, 142
LDI r7, 58
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
