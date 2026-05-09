; DESCRIPTION: Composite: Renders a red disk with center (113, 80) and radius 63 then Creates a magenta rectangular region at (434, 0) spanning 25 by 119 pixels then Sets a single black pixel at (98, 52).
; PLAN: r0=113(x), r1=80(y), r2=63(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=434(x), r6=0(y), r7=25(width), r8=119(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=98(x), r11=52(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 113
LDI r1, 80
LDI r2, 63
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 434
LDI r6, 0
LDI r7, 25
LDI r8, 119
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 98
LDI r11, 52
LDI r12, 0x000000
PSET r10, r11, r12
HALT
