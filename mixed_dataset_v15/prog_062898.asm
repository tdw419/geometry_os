; DESCRIPTION: Composite: Renders a orange box of size 112x40 starting at (181, 24) then Renders a blue disk with center (183, 85) and radius 42.
; PLAN: r0=181(x), r1=24(y), r2=112(width), r3=40(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=85(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 24
LDI r2, 112
LDI r3, 40
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 85
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
