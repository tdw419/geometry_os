; DESCRIPTION: Composite: Places a white line segment connecting (245, 200) to (396, 157) then Places a yellow 61x79 rectangle at position (122, 90) then Places a magenta dot at position (484, 55).
; PLAN: r0=245(x1), r1=200(y1), r2=396(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=122(x), r6=90(y), r7=61(width), r8=79(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=484(x), r11=55(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 245
LDI r1, 200
LDI r2, 396
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 90
LDI r7, 61
LDI r8, 79
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 484
LDI r11, 55
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
