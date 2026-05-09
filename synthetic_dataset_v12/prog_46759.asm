; DESCRIPTION: Composite: Places a cyan line segment connecting (225, 97) to (359, 19) then Places a green dot at position (492, 16) then Places a white circle of radius 58 at center (76, 162).
; PLAN: r0=225(x1), r1=97(y1), r2=359(x2), r3=19(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=492(x), r6=16(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=76(x), r11=162(y), r12=58(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 225
LDI r1, 97
LDI r2, 359
LDI r3, 19
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 16
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 76
LDI r11, 162
LDI r12, 58
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
