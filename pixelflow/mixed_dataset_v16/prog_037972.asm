; DESCRIPTION: Composite: Places a yellow dot at position (254, 103) then Places a blue line segment connecting (499, 105) to (61, 149) then Places a cyan circle of radius 79 at center (136, 111).
; PLAN: r0=254(x), r1=103(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=499(x1), r6=105(y1), r7=61(x2), r8=149(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=136(x), r11=111(y), r12=79(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 254
LDI r1, 103
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 499
LDI r6, 105
LDI r7, 61
LDI r8, 149
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 136
LDI r11, 111
LDI r12, 79
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
