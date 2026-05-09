; DESCRIPTION: Composite: Renders a yellow box of size 80x78 starting at (393, 118) then Sets a single black pixel at (150, 127) then Creates a purple circular shape at (307, 130) with radius 35.
; PLAN: r0=393(x), r1=118(y), r2=80(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=127(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=307(x), r11=130(y), r12=35(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 393
LDI r1, 118
LDI r2, 80
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 127
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 307
LDI r11, 130
LDI r12, 35
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
