; DESCRIPTION: Composite: Renders a green box of size 10x45 starting at (120, 85) then Sets a single blue pixel at (20, 31) then Creates a blue circular shape at (51, 168) with radius 35.
; PLAN: r0=120(x), r1=85(y), r2=10(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=20(x), r6=31(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=51(x), r11=168(y), r12=35(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 120
LDI r1, 85
LDI r2, 10
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 20
LDI r6, 31
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 51
LDI r11, 168
LDI r12, 35
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
