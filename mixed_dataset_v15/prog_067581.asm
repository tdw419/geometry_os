; DESCRIPTION: Composite: Renders a white line between points (44, 171) and (16, 15) then Draws a blue circle centered at (440, 114) with radius 10 then Sets a single green pixel at (101, 158).
; PLAN: r0=44(x1), r1=171(y1), r2=16(x2), r3=15(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=440(x), r6=114(y), r7=10(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=101(x), r11=158(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 44
LDI r1, 171
LDI r2, 16
LDI r3, 15
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 440
LDI r6, 114
LDI r7, 10
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 101
LDI r11, 158
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
