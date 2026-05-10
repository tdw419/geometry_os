; DESCRIPTION: Composite: Draws a green line from (341, 215) to (252, 89) then Places a orange dot at position (266, 190) then Places a purple 55x56 rectangle at position (389, 141).
; PLAN: r0=341(x1), r1=215(y1), r2=252(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=266(x), r6=190(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=389(x), r11=141(y), r12=55(width), r13=56(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 341
LDI r1, 215
LDI r2, 252
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 266
LDI r6, 190
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 389
LDI r11, 141
LDI r12, 55
LDI r13, 56
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
