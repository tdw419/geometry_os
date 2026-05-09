; DESCRIPTION: Composite: Places a blue line segment connecting (238, 49) to (455, 171) then Creates a magenta rectangular region at (212, 131) spanning 115 by 23 pixels then Places a blue dot at position (241, 3).
; PLAN: r0=238(x1), r1=49(y1), r2=455(x2), r3=171(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=212(x), r6=131(y), r7=115(width), r8=23(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=241(x), r11=3(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 238
LDI r1, 49
LDI r2, 455
LDI r3, 171
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 131
LDI r7, 115
LDI r8, 23
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 241
LDI r11, 3
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
