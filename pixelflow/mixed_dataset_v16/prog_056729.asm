; DESCRIPTION: Composite: Places a cyan dot at position (32, 8) then Places a cyan line segment connecting (406, 55) to (258, 76) then Draws a white circle centered at (340, 155) with radius 21.
; PLAN: r0=32(x), r1=8(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=406(x1), r6=55(y1), r7=258(x2), r8=76(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=340(x), r11=155(y), r12=21(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 32
LDI r1, 8
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 406
LDI r6, 55
LDI r7, 258
LDI r8, 76
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 340
LDI r11, 155
LDI r12, 21
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
