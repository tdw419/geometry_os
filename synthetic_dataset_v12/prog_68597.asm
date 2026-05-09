; DESCRIPTION: Composite: Places a cyan dot at position (300, 146) then Places a magenta circle of radius 32 at center (118, 87) then Renders a orange line between points (508, 55) and (48, 217).
; PLAN: r0=300(x), r1=146(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=118(x), r6=87(y), r7=32(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=508(x1), r11=55(y1), r12=48(x2), r13=217(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 300
LDI r1, 146
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 118
LDI r6, 87
LDI r7, 32
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 508
LDI r11, 55
LDI r12, 48
LDI r13, 217
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
