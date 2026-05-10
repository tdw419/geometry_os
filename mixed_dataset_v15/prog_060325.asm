; DESCRIPTION: Composite: Draws a purple circle centered at (71, 206) with radius 11 then Renders a yellow box of size 43x76 starting at (385, 118).
; PLAN: r0=71(x), r1=206(y), r2=11(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=118(y), r7=43(width), r8=76(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 71
LDI r1, 206
LDI r2, 11
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 118
LDI r7, 43
LDI r8, 76
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
