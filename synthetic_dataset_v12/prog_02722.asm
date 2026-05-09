; DESCRIPTION: Composite: Draws a orange line from (232, 115) to (458, 74) then Sets a single green pixel at (493, 192) then Places a yellow 14x115 rectangle at position (365, 45).
; PLAN: r0=232(x1), r1=115(y1), r2=458(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=493(x), r6=192(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=365(x), r11=45(y), r12=14(width), r13=115(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 115
LDI r2, 458
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 192
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 365
LDI r11, 45
LDI r12, 14
LDI r13, 115
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
