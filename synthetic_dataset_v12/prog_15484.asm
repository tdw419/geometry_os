; DESCRIPTION: Composite: Places a red line segment connecting (59, 71) to (439, 50) then Sets a single magenta pixel at (329, 195) then Creates a white circular shape at (298, 93) with radius 60.
; PLAN: r0=59(x1), r1=71(y1), r2=439(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=329(x), r6=195(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=298(x), r11=93(y), r12=60(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 59
LDI r1, 71
LDI r2, 439
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 329
LDI r6, 195
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 298
LDI r11, 93
LDI r12, 60
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
