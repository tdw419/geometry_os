; DESCRIPTION: Composite: Creates a magenta circular shape at (106, 150) with radius 75 then Creates a magenta rectangular region at (251, 95) spanning 14 by 59 pixels then Sets a single red pixel at (49, 193).
; PLAN: r0=106(x), r1=150(y), r2=75(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=251(x), r6=95(y), r7=14(width), r8=59(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=49(x), r11=193(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 106
LDI r1, 150
LDI r2, 75
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 251
LDI r6, 95
LDI r7, 14
LDI r8, 59
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 49
LDI r11, 193
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
