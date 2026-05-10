; DESCRIPTION: Composite: Places a white line segment connecting (272, 120) to (327, 164) then Creates a green circular shape at (368, 87) with radius 49.
; PLAN: r0=272(x1), r1=120(y1), r2=327(x2), r3=164(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=87(y), r7=49(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 272
LDI r1, 120
LDI r2, 327
LDI r3, 164
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 87
LDI r7, 49
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
