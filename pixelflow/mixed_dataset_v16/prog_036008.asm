; DESCRIPTION: Composite: Places a white dot at position (407, 122) then Renders a white disk with center (429, 70) and radius 54.
; PLAN: r0=407(x), r1=122(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=429(x), r6=70(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 122
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 429
LDI r6, 70
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
