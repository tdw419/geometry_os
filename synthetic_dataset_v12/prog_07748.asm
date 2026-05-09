; DESCRIPTION: Composite: Places a white circle of radius 56 at center (80, 180) then Renders a orange line between points (488, 61) and (220, 115).
; PLAN: r0=80(x), r1=180(y), r2=56(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x1), r6=61(y1), r7=220(x2), r8=115(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 180
LDI r2, 56
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 61
LDI r7, 220
LDI r8, 115
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
