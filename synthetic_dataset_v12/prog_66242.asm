; DESCRIPTION: Composite: Places a black line segment connecting (172, 171) to (346, 159) then Draws a purple circle centered at (487, 117) with radius 12.
; PLAN: r0=172(x1), r1=171(y1), r2=346(x2), r3=159(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=487(x), r6=117(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 172
LDI r1, 171
LDI r2, 346
LDI r3, 159
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 487
LDI r6, 117
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
