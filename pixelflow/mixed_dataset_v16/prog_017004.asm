; DESCRIPTION: Composite: Creates a orange circular shape at (240, 157) with radius 49 then Places a black line segment connecting (332, 150) to (397, 168).
; PLAN: r0=240(x), r1=157(y), r2=49(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=332(x1), r6=150(y1), r7=397(x2), r8=168(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 157
LDI r2, 49
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 332
LDI r6, 150
LDI r7, 397
LDI r8, 168
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
