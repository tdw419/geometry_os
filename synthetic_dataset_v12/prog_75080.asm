; DESCRIPTION: Composite: Renders a orange box of size 115x109 starting at (143, 97) then Renders a purple disk with center (67, 120) and radius 38.
; PLAN: r0=143(x), r1=97(y), r2=115(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=120(y), r7=38(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 143
LDI r1, 97
LDI r2, 115
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 120
LDI r7, 38
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
