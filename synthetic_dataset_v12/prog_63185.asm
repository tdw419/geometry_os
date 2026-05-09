; DESCRIPTION: Composite: Renders a yellow box of size 35x77 starting at (53, 6) then Places a white circle of radius 75 at center (248, 149).
; PLAN: r0=53(x), r1=6(y), r2=35(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=248(x), r6=149(y), r7=75(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 6
LDI r2, 35
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 248
LDI r6, 149
LDI r7, 75
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
