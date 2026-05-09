; DESCRIPTION: Composite: Renders a purple box of size 86x34 starting at (108, 17) then Sets a single yellow pixel at (283, 111) then Places a green circle of radius 61 at center (328, 123).
; PLAN: r0=108(x), r1=17(y), r2=86(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=283(x), r6=111(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=328(x), r11=123(y), r12=61(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 108
LDI r1, 17
LDI r2, 86
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 283
LDI r6, 111
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 328
LDI r11, 123
LDI r12, 61
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
