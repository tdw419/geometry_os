; DESCRIPTION: Composite: Places a blue circle of radius 34 at center (78, 77) then Renders a orange box of size 76x119 starting at (22, 38).
; PLAN: r0=78(x), r1=77(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=38(y), r7=76(width), r8=119(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 77
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 38
LDI r7, 76
LDI r8, 119
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
