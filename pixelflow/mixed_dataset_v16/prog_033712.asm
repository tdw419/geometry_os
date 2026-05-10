; DESCRIPTION: Composite: Places a purple line segment connecting (456, 46) to (443, 145) then Renders a yellow box of size 110x80 starting at (249, 17) then Places a cyan dot at position (66, 29).
; PLAN: r0=456(x1), r1=46(y1), r2=443(x2), r3=145(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=249(x), r6=17(y), r7=110(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=66(x), r11=29(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 456
LDI r1, 46
LDI r2, 443
LDI r3, 145
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 17
LDI r7, 110
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 66
LDI r11, 29
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
