; DESCRIPTION: Composite: Renders a purple box of size 65x73 starting at (422, 52) then Draws a blue circle centered at (301, 136) with radius 32.
; PLAN: r0=422(x), r1=52(y), r2=65(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=136(y), r7=32(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 422
LDI r1, 52
LDI r2, 65
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 136
LDI r7, 32
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
