; DESCRIPTION: Composite: Renders a magenta disk with center (345, 177) and radius 60 then Creates a red rectangular region at (312, 104) spanning 91 by 107 pixels then Sets a single cyan pixel at (119, 172).
; PLAN: r0=345(x), r1=177(y), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=104(y), r7=91(width), r8=107(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=119(x), r11=172(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 177
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 104
LDI r7, 91
LDI r8, 107
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 172
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
