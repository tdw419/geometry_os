; DESCRIPTION: Composite: Draws a cyan circle centered at (141, 123) with radius 47 then Places a white line segment connecting (431, 37) to (363, 6).
; PLAN: r0=141(x), r1=123(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x1), r6=37(y1), r7=363(x2), r8=6(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 141
LDI r1, 123
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 37
LDI r7, 363
LDI r8, 6
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
