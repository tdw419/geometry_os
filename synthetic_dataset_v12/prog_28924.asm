; DESCRIPTION: Composite: Renders a red line between points (378, 151) and (387, 26) then Places a purple dot at position (251, 38) then Places a black 57x110 rectangle at position (360, 109).
; PLAN: r0=378(x1), r1=151(y1), r2=387(x2), r3=26(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=251(x), r6=38(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=360(x), r11=109(y), r12=57(width), r13=110(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 378
LDI r1, 151
LDI r2, 387
LDI r3, 26
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 251
LDI r6, 38
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 360
LDI r11, 109
LDI r12, 57
LDI r13, 110
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
