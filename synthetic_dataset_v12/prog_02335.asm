; DESCRIPTION: Composite: Renders a orange line between points (481, 43) and (300, 114) then Places a yellow circle of radius 29 at center (219, 79).
; PLAN: r0=481(x1), r1=43(y1), r2=300(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=219(x), r6=79(y), r7=29(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 43
LDI r2, 300
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 219
LDI r6, 79
LDI r7, 29
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
