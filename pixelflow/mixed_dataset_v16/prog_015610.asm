; DESCRIPTION: Composite: Places a cyan line segment connecting (435, 35) to (296, 193) then Creates a magenta circular shape at (438, 114) with radius 53.
; PLAN: r0=435(x1), r1=35(y1), r2=296(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=438(x), r6=114(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 435
LDI r1, 35
LDI r2, 296
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 438
LDI r6, 114
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
