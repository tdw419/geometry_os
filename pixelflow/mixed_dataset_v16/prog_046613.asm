; DESCRIPTION: Composite: Renders a blue box of size 61x89 starting at (433, 75) then Sets a single red pixel at (315, 76) then Places a white circle of radius 48 at center (421, 140).
; PLAN: r0=433(x), r1=75(y), r2=61(width), r3=89(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=315(x), r6=76(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=421(x), r11=140(y), r12=48(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 433
LDI r1, 75
LDI r2, 61
LDI r3, 89
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 315
LDI r6, 76
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 421
LDI r11, 140
LDI r12, 48
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
