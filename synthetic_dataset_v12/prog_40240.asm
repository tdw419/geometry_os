; DESCRIPTION: Composite: Draws a cyan circle centered at (390, 82) with radius 69 then Places a cyan line segment connecting (57, 234) to (100, 239) then Places a cyan dot at position (364, 168).
; PLAN: r0=390(x), r1=82(y), r2=69(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x1), r6=234(y1), r7=100(x2), r8=239(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=364(x), r11=168(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 390
LDI r1, 82
LDI r2, 69
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 234
LDI r7, 100
LDI r8, 239
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 364
LDI r11, 168
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
