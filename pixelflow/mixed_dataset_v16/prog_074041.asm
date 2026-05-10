; DESCRIPTION: Composite: Places a black line segment connecting (197, 6) to (111, 5) then Creates a black circular shape at (126, 171) with radius 80 then Sets a single blue pixel at (96, 57).
; PLAN: r0=197(x1), r1=6(y1), r2=111(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=171(y), r7=80(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=96(x), r11=57(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 197
LDI r1, 6
LDI r2, 111
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 171
LDI r7, 80
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 96
LDI r11, 57
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
