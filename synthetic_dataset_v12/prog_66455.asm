; DESCRIPTION: Composite: Draws a white line from (477, 49) to (18, 226) then Places a cyan 72x73 rectangle at position (266, 179) then Sets a single green pixel at (39, 254).
; PLAN: r0=477(x1), r1=49(y1), r2=18(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=179(y), r7=72(width), r8=73(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=39(x), r11=254(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 477
LDI r1, 49
LDI r2, 18
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 179
LDI r7, 72
LDI r8, 73
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 39
LDI r11, 254
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
