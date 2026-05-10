; DESCRIPTION: Composite: Draws a green line from (503, 188) to (69, 183) then Places a white 105x41 rectangle at position (266, 102) then Sets a single purple pixel at (84, 64).
; PLAN: r0=503(x1), r1=188(y1), r2=69(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=102(y), r7=105(width), r8=41(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=84(x), r11=64(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 503
LDI r1, 188
LDI r2, 69
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 102
LDI r7, 105
LDI r8, 41
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 84
LDI r11, 64
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
