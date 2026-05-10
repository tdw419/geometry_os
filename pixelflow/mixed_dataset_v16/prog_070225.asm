; DESCRIPTION: Composite: Creates a blue rectangular region at (103, 197) spanning 97 by 10 pixels then Sets a single cyan pixel at (424, 175) then Renders a yellow disk with center (73, 161) and radius 58.
; PLAN: r0=103(x), r1=197(y), r2=97(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=424(x), r6=175(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=161(y), r12=58(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 103
LDI r1, 197
LDI r2, 97
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 424
LDI r6, 175
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 73
LDI r11, 161
LDI r12, 58
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
