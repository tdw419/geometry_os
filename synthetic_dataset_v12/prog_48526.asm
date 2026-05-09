; DESCRIPTION: Composite: Places a black 65x107 rectangle at position (433, 61) then Renders a purple line between points (344, 112) and (266, 183).
; PLAN: r0=433(x), r1=61(y), r2=65(width), r3=107(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=344(x1), r6=112(y1), r7=266(x2), r8=183(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 433
LDI r1, 61
LDI r2, 65
LDI r3, 107
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 344
LDI r6, 112
LDI r7, 266
LDI r8, 183
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
