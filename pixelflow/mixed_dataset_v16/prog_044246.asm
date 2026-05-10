; DESCRIPTION: Composite: Draws a white circle centered at (269, 93) with radius 80 then Draws a black line from (460, 108) to (234, 201).
; PLAN: r0=269(x), r1=93(y), r2=80(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=460(x1), r6=108(y1), r7=234(x2), r8=201(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 269
LDI r1, 93
LDI r2, 80
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 460
LDI r6, 108
LDI r7, 234
LDI r8, 201
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
