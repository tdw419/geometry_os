; DESCRIPTION: Composite: Renders a white line between points (171, 32) and (262, 140) then Draws a magenta circle centered at (391, 136) with radius 75 then Places a orange dot at position (257, 96).
; PLAN: r0=171(x1), r1=32(y1), r2=262(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=391(x), r6=136(y), r7=75(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=257(x), r11=96(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 32
LDI r2, 262
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 391
LDI r6, 136
LDI r7, 75
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 257
LDI r11, 96
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
