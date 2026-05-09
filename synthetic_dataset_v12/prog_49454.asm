; DESCRIPTION: Composite: Sets a single magenta pixel at (152, 236) then Creates a red rectangular region at (175, 140) spanning 120 by 14 pixels then Creates a white circular shape at (80, 64) with radius 49.
; PLAN: r0=152(x), r1=236(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=175(x), r6=140(y), r7=120(width), r8=14(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=80(x), r11=64(y), r12=49(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 152
LDI r1, 236
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 175
LDI r6, 140
LDI r7, 120
LDI r8, 14
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 80
LDI r11, 64
LDI r12, 49
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
