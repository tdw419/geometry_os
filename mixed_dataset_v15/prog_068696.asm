; DESCRIPTION: Composite: Creates a red rectangular region at (436, 148) spanning 11 by 98 pixels then Places a green line segment connecting (45, 75) to (363, 113) then Sets a single green pixel at (69, 121).
; PLAN: r0=436(x), r1=148(y), r2=11(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=45(x1), r6=75(y1), r7=363(x2), r8=113(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=69(x), r11=121(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 436
LDI r1, 148
LDI r2, 11
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 45
LDI r6, 75
LDI r7, 363
LDI r8, 113
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 121
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
