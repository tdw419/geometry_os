; DESCRIPTION: Composite: Draws a black line from (364, 74) to (120, 124) then Places a white dot at position (467, 138) then Creates a magenta circular shape at (168, 74) with radius 74.
; PLAN: r0=364(x1), r1=74(y1), r2=120(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=138(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=168(x), r11=74(y), r12=74(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 74
LDI r2, 120
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 138
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 74
LDI r12, 74
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
