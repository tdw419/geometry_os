; DESCRIPTION: Composite: Renders a orange box of size 119x109 starting at (212, 0) then Renders a green disk with center (412, 183) and radius 59.
; PLAN: r0=212(x), r1=0(y), r2=119(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=183(y), r7=59(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 212
LDI r1, 0
LDI r2, 119
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 183
LDI r7, 59
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
