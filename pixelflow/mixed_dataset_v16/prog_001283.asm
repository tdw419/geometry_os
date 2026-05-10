; DESCRIPTION: Composite: Draws a red circle centered at (151, 80) with radius 60 then Places a cyan line segment connecting (69, 132) to (74, 185) then Sets a single green pixel at (446, 188).
; PLAN: r0=151(x), r1=80(y), r2=60(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=69(x1), r6=132(y1), r7=74(x2), r8=185(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=446(x), r11=188(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 80
LDI r2, 60
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 69
LDI r6, 132
LDI r7, 74
LDI r8, 185
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 446
LDI r11, 188
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
