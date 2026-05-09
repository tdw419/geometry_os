; DESCRIPTION: Composite: Renders a white line between points (236, 192) and (82, 34) then Places a black 97x106 rectangle at position (287, 42) then Sets a single white pixel at (217, 117).
; PLAN: r0=236(x1), r1=192(y1), r2=82(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=287(x), r6=42(y), r7=97(width), r8=106(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=217(x), r11=117(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 192
LDI r2, 82
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 287
LDI r6, 42
LDI r7, 97
LDI r8, 106
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 217
LDI r11, 117
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
