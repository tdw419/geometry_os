; DESCRIPTION: Composite: Creates a blue rectangular region at (248, 18) spanning 46 by 94 pixels then Sets a single magenta pixel at (90, 146) then Renders a purple disk with center (138, 74) and radius 12.
; PLAN: r0=248(x), r1=18(y), r2=46(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=90(x), r6=146(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=138(x), r11=74(y), r12=12(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 248
LDI r1, 18
LDI r2, 46
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 90
LDI r6, 146
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 138
LDI r11, 74
LDI r12, 12
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
