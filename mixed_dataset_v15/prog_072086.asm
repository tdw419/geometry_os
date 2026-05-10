; DESCRIPTION: Composite: Renders a blue disk with center (135, 146) and radius 80 then Creates a white rectangular region at (153, 131) spanning 108 by 77 pixels then Places a white dot at position (35, 81).
; PLAN: r0=135(x), r1=146(y), r2=80(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=153(x), r6=131(y), r7=108(width), r8=77(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=35(x), r11=81(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 135
LDI r1, 146
LDI r2, 80
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 153
LDI r6, 131
LDI r7, 108
LDI r8, 77
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 35
LDI r11, 81
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
