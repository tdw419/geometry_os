; DESCRIPTION: Composite: Places a purple circle of radius 47 at center (59, 158) then Renders a black box of size 101x47 starting at (283, 136).
; PLAN: r0=59(x), r1=158(y), r2=47(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=283(x), r6=136(y), r7=101(width), r8=47(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 59
LDI r1, 158
LDI r2, 47
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 283
LDI r6, 136
LDI r7, 101
LDI r8, 47
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
