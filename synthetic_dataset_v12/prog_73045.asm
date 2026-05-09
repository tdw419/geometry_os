; DESCRIPTION: Composite: Places a white line segment connecting (289, 82) to (191, 150) then Places a orange circle of radius 47 at center (294, 126).
; PLAN: r0=289(x1), r1=82(y1), r2=191(x2), r3=150(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=294(x), r6=126(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 289
LDI r1, 82
LDI r2, 191
LDI r3, 150
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 126
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
