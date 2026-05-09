; DESCRIPTION: Composite: Renders a blue box of size 99x82 starting at (153, 27) then Sets a single orange pixel at (59, 120) then Creates a black circular shape at (377, 178) with radius 35.
; PLAN: r0=153(x), r1=27(y), r2=99(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=59(x), r6=120(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=377(x), r11=178(y), r12=35(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 153
LDI r1, 27
LDI r2, 99
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 120
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 377
LDI r11, 178
LDI r12, 35
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
