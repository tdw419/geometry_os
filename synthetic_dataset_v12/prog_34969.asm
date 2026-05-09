; DESCRIPTION: Composite: Renders a yellow box of size 11x96 starting at (60, 150) then Places a blue dot at position (217, 53) then Places a white circle of radius 38 at center (247, 79).
; PLAN: r0=60(x), r1=150(y), r2=11(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=53(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=247(x), r11=79(y), r12=38(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 150
LDI r2, 11
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 53
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 247
LDI r11, 79
LDI r12, 38
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
