; DESCRIPTION: Composite: Renders a purple box of size 101x30 starting at (61, 185) then Draws a green circle centered at (50, 171) with radius 31.
; PLAN: r0=61(x), r1=185(y), r2=101(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x), r6=171(y), r7=31(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 61
LDI r1, 185
LDI r2, 101
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 171
LDI r7, 31
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
