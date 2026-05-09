; DESCRIPTION: Composite: Renders a blue line between points (231, 62) and (17, 57) then Places a cyan circle of radius 69 at center (337, 159) then Sets a single black pixel at (462, 218).
; PLAN: r0=231(x1), r1=62(y1), r2=17(x2), r3=57(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=337(x), r6=159(y), r7=69(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=462(x), r11=218(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 231
LDI r1, 62
LDI r2, 17
LDI r3, 57
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 337
LDI r6, 159
LDI r7, 69
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 462
LDI r11, 218
LDI r12, 0x000000
PSET r10, r11, r12
HALT
