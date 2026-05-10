; DESCRIPTION: Composite: Places a green line segment connecting (5, 226) to (356, 13) then Creates a blue circular shape at (197, 150) with radius 76 then Places a purple dot at position (495, 211).
; PLAN: r0=5(x1), r1=226(y1), r2=356(x2), r3=13(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=197(x), r6=150(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=495(x), r11=211(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 5
LDI r1, 226
LDI r2, 356
LDI r3, 13
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 150
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 495
LDI r11, 211
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
