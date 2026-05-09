; DESCRIPTION: Composite: Creates a purple rectangular region at (367, 202) spanning 84 by 18 pixels then Sets a single green pixel at (301, 183) then Renders a green disk with center (389, 240) and radius 11.
; PLAN: r0=367(x), r1=202(y), r2=84(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=183(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=240(y), r12=11(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 367
LDI r1, 202
LDI r2, 84
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 183
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 389
LDI r11, 240
LDI r12, 11
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
