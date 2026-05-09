; DESCRIPTION: Composite: Sets a single red pixel at (33, 180) then Places a cyan line segment connecting (49, 12) to (494, 152) then Draws a white circle centered at (419, 212) with radius 21.
; PLAN: r0=33(x), r1=180(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=49(x1), r6=12(y1), r7=494(x2), r8=152(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=419(x), r11=212(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 33
LDI r1, 180
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 49
LDI r6, 12
LDI r7, 494
LDI r8, 152
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 419
LDI r11, 212
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
