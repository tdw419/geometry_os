; DESCRIPTION: Composite: Places a cyan line segment connecting (139, 72) to (24, 95) then Draws a yellow rectangle at (234, 140) with width 45 and height 38 then Sets a single green pixel at (208, 244).
; PLAN: r0=139(x1), r1=72(y1), r2=24(x2), r3=95(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=234(x), r6=140(y), r7=45(width), r8=38(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=208(x), r11=244(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 139
LDI r1, 72
LDI r2, 24
LDI r3, 95
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 234
LDI r6, 140
LDI r7, 45
LDI r8, 38
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 208
LDI r11, 244
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
