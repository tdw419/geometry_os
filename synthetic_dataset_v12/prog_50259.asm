; DESCRIPTION: Composite: Places a cyan line segment connecting (498, 102) to (471, 31) then Renders a white disk with center (77, 122) and radius 63.
; PLAN: r0=498(x1), r1=102(y1), r2=471(x2), r3=31(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=77(x), r6=122(y), r7=63(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 498
LDI r1, 102
LDI r2, 471
LDI r3, 31
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 77
LDI r6, 122
LDI r7, 63
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
