; DESCRIPTION: Composite: Creates a yellow circular shape at (152, 90) with radius 79 then Renders a magenta line between points (120, 236) and (74, 94) then Places a yellow dot at position (189, 156).
; PLAN: r0=152(x), r1=90(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x1), r6=236(y1), r7=74(x2), r8=94(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=189(x), r11=156(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 90
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 236
LDI r7, 74
LDI r8, 94
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 156
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
