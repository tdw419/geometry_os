; DESCRIPTION: Composite: Places a red line segment connecting (490, 238) to (48, 106) then Renders a red disk with center (150, 149) and radius 36 then Places a cyan dot at position (58, 44).
; PLAN: r0=490(x1), r1=238(y1), r2=48(x2), r3=106(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=150(x), r6=149(y), r7=36(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=58(x), r11=44(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 490
LDI r1, 238
LDI r2, 48
LDI r3, 106
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 149
LDI r7, 36
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 58
LDI r11, 44
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
