; DESCRIPTION: Composite: Creates a magenta circular shape at (195, 122) with radius 73 then Renders a red line between points (411, 124) and (301, 31) then Sets a single purple pixel at (422, 149).
; PLAN: r0=195(x), r1=122(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=411(x1), r6=124(y1), r7=301(x2), r8=31(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=149(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 195
LDI r1, 122
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 411
LDI r6, 124
LDI r7, 301
LDI r8, 31
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 149
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
