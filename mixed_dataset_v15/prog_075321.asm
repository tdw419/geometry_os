; DESCRIPTION: Composite: Draws a orange circle centered at (381, 191) with radius 55 then Renders a white line between points (387, 33) and (326, 91).
; PLAN: r0=381(x), r1=191(y), r2=55(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x1), r6=33(y1), r7=326(x2), r8=91(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 381
LDI r1, 191
LDI r2, 55
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 33
LDI r7, 326
LDI r8, 91
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
