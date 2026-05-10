; DESCRIPTION: Composite: Places a black line segment connecting (365, 19) to (13, 214) then Draws a red circle centered at (134, 202) with radius 10.
; PLAN: r0=365(x1), r1=19(y1), r2=13(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=134(x), r6=202(y), r7=10(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 365
LDI r1, 19
LDI r2, 13
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 134
LDI r6, 202
LDI r7, 10
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
