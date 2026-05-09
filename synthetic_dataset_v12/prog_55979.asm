; DESCRIPTION: Composite: Places a black line segment connecting (285, 143) to (398, 176) then Draws a cyan circle centered at (276, 148) with radius 70.
; PLAN: r0=285(x1), r1=143(y1), r2=398(x2), r3=176(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=276(x), r6=148(y), r7=70(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 285
LDI r1, 143
LDI r2, 398
LDI r3, 176
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 148
LDI r7, 70
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
