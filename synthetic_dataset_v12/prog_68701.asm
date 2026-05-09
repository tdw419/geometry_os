; DESCRIPTION: Composite: Places a magenta circle of radius 24 at center (165, 58) then Renders a white line between points (44, 84) and (109, 64) then Places a orange dot at position (442, 221).
; PLAN: r0=165(x), r1=58(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x1), r6=84(y1), r7=109(x2), r8=64(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=442(x), r11=221(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 58
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 84
LDI r7, 109
LDI r8, 64
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 442
LDI r11, 221
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
