; DESCRIPTION: Composite: Places a magenta line segment connecting (179, 174) to (116, 155) then Renders a white disk with center (117, 50) and radius 28 then Places a white dot at position (73, 44).
; PLAN: r0=179(x1), r1=174(y1), r2=116(x2), r3=155(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=117(x), r6=50(y), r7=28(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=73(x), r11=44(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 174
LDI r2, 116
LDI r3, 155
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 50
LDI r7, 28
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 73
LDI r11, 44
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
