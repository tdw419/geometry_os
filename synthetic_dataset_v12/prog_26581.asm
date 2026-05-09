; DESCRIPTION: Composite: Places a white circle of radius 25 at center (286, 87) then Places a white line segment connecting (53, 79) to (488, 74).
; PLAN: r0=286(x), r1=87(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=53(x1), r6=79(y1), r7=488(x2), r8=74(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 286
LDI r1, 87
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 53
LDI r6, 79
LDI r7, 488
LDI r8, 74
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
