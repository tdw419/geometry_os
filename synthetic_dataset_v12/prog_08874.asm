; DESCRIPTION: Composite: Renders a purple box of size 53x62 starting at (397, 187) then Draws a yellow circle centered at (452, 164) with radius 38.
; PLAN: r0=397(x), r1=187(y), r2=53(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=452(x), r6=164(y), r7=38(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 397
LDI r1, 187
LDI r2, 53
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 164
LDI r7, 38
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
