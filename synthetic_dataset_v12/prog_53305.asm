; DESCRIPTION: Composite: Places a cyan circle of radius 74 at center (355, 74) then Places a red dot at position (199, 78) then Places a white line segment connecting (443, 84) to (354, 73).
; PLAN: r0=355(x), r1=74(y), r2=74(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=78(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=443(x1), r11=84(y1), r12=354(x2), r13=73(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 355
LDI r1, 74
LDI r2, 74
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 78
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 443
LDI r11, 84
LDI r12, 354
LDI r13, 73
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
