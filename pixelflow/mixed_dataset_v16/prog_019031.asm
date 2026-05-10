; DESCRIPTION: Composite: Renders a orange line between points (21, 118) and (228, 237) then Draws a red circle centered at (64, 48) with radius 35 then Places a blue dot at position (251, 234).
; PLAN: r0=21(x1), r1=118(y1), r2=228(x2), r3=237(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=64(x), r6=48(y), r7=35(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=251(x), r11=234(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 21
LDI r1, 118
LDI r2, 228
LDI r3, 237
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 64
LDI r6, 48
LDI r7, 35
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 251
LDI r11, 234
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
