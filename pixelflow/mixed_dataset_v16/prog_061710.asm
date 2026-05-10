; DESCRIPTION: Composite: Creates a cyan rectangular region at (216, 27) spanning 95 by 59 pixels then Renders a black disk with center (125, 114) and radius 75 then Sets a single red pixel at (441, 223).
; PLAN: r0=216(x), r1=27(y), r2=95(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=114(y), r7=75(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=441(x), r11=223(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 216
LDI r1, 27
LDI r2, 95
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 114
LDI r7, 75
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 441
LDI r11, 223
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
