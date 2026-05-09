; DESCRIPTION: Composite: Renders a orange line between points (80, 228) and (49, 102) then Places a white circle of radius 75 at center (262, 156).
; PLAN: r0=80(x1), r1=228(y1), r2=49(x2), r3=102(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=156(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 80
LDI r1, 228
LDI r2, 49
LDI r3, 102
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 156
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
