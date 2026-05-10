; DESCRIPTION: Composite: Renders a magenta line between points (179, 118) and (245, 150) then Places a purple 111x35 rectangle at position (327, 71) then Sets a single white pixel at (448, 233).
; PLAN: r0=179(x1), r1=118(y1), r2=245(x2), r3=150(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=327(x), r6=71(y), r7=111(width), r8=35(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=448(x), r11=233(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 118
LDI r2, 245
LDI r3, 150
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 327
LDI r6, 71
LDI r7, 111
LDI r8, 35
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 448
LDI r11, 233
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
