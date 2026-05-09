; DESCRIPTION: Composite: Creates a blue rectangular region at (329, 110) spanning 33 by 76 pixels then Places a green line segment connecting (490, 210) to (111, 206) then Places a cyan dot at position (45, 84).
; PLAN: r0=329(x), r1=110(y), r2=33(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=490(x1), r6=210(y1), r7=111(x2), r8=206(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=45(x), r11=84(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 329
LDI r1, 110
LDI r2, 33
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 490
LDI r6, 210
LDI r7, 111
LDI r8, 206
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 45
LDI r11, 84
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
