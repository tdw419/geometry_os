; DESCRIPTION: Composite: Renders a purple box of size 33x20 starting at (263, 205) then Draws a green circle centered at (112, 163) with radius 76.
; PLAN: r0=263(x), r1=205(y), r2=33(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=112(x), r6=163(y), r7=76(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 205
LDI r2, 33
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 112
LDI r6, 163
LDI r7, 76
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
