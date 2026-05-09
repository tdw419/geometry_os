; DESCRIPTION: Composite: Renders a blue disk with center (327, 159) and radius 43 then Creates a red rectangular region at (353, 16) spanning 74 by 74 pixels.
; PLAN: r0=327(x), r1=159(y), r2=43(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=353(x), r6=16(y), r7=74(width), r8=74(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 159
LDI r2, 43
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 353
LDI r6, 16
LDI r7, 74
LDI r8, 74
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
