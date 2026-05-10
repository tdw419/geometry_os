; DESCRIPTION: Composite: Places a orange line segment connecting (183, 214) to (387, 32) then Renders a white disk with center (232, 226) and radius 30.
; PLAN: r0=183(x1), r1=214(y1), r2=387(x2), r3=32(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=232(x), r6=226(y), r7=30(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 183
LDI r1, 214
LDI r2, 387
LDI r3, 32
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 226
LDI r7, 30
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
