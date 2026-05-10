; DESCRIPTION: Composite: Renders a magenta box of size 31x112 starting at (101, 112) then Places a black circle of radius 51 at center (125, 193) then Places a yellow dot at position (471, 169).
; PLAN: r0=101(x), r1=112(y), r2=31(width), r3=112(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x), r6=193(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=471(x), r11=169(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 101
LDI r1, 112
LDI r2, 31
LDI r3, 112
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 193
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 471
LDI r11, 169
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
