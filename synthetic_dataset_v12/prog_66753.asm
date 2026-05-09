; DESCRIPTION: Composite: Creates a yellow circular shape at (464, 196) with radius 45 then Places a orange line segment connecting (387, 113) to (308, 188).
; PLAN: r0=464(x), r1=196(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x1), r6=113(y1), r7=308(x2), r8=188(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 464
LDI r1, 196
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 113
LDI r7, 308
LDI r8, 188
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
