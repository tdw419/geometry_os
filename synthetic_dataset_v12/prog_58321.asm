; DESCRIPTION: Composite: Renders a white line between points (460, 49) and (14, 196) then Renders a orange disk with center (452, 141) and radius 52.
; PLAN: r0=460(x1), r1=49(y1), r2=14(x2), r3=196(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=141(y), r7=52(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 49
LDI r2, 14
LDI r3, 196
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 141
LDI r7, 52
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
