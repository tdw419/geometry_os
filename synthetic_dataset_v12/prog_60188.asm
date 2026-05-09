; DESCRIPTION: Composite: Places a green dot at position (419, 238) then Places a red line segment connecting (452, 77) to (461, 3) then Creates a cyan rectangular region at (303, 184) spanning 92 by 67 pixels.
; PLAN: r0=419(x), r1=238(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=452(x1), r6=77(y1), r7=461(x2), r8=3(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=303(x), r11=184(y), r12=92(width), r13=67(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 238
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 452
LDI r6, 77
LDI r7, 461
LDI r8, 3
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 303
LDI r11, 184
LDI r12, 92
LDI r13, 67
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
