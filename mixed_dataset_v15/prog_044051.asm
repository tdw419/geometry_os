; DESCRIPTION: Composite: Sets a single purple pixel at (170, 127) then Places a green circle of radius 77 at center (232, 108) then Renders a red box of size 13x50 starting at (397, 78).
; PLAN: r0=170(x), r1=127(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=232(x), r6=108(y), r7=77(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=397(x), r11=78(y), r12=13(width), r13=50(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 127
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 232
LDI r6, 108
LDI r7, 77
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 397
LDI r11, 78
LDI r12, 13
LDI r13, 50
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
