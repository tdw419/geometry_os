; DESCRIPTION: Composite: Creates a red rectangular region at (68, 195) spanning 47 by 39 pixels then Sets a single magenta pixel at (494, 212) then Renders a white disk with center (345, 147) and radius 78.
; PLAN: r0=68(x), r1=195(y), r2=47(width), r3=39(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=494(x), r6=212(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=345(x), r11=147(y), r12=78(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 68
LDI r1, 195
LDI r2, 47
LDI r3, 39
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 494
LDI r6, 212
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 345
LDI r11, 147
LDI r12, 78
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
