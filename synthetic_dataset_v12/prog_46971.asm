; DESCRIPTION: Composite: Places a cyan dot at position (227, 60) then Creates a green rectangular region at (127, 95) spanning 52 by 102 pixels then Draws a white circle centered at (358, 86) with radius 48.
; PLAN: r0=227(x), r1=60(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=95(y), r7=52(width), r8=102(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=358(x), r11=86(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 227
LDI r1, 60
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 95
LDI r7, 52
LDI r8, 102
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 358
LDI r11, 86
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
