; DESCRIPTION: Composite: Places a cyan 45x103 rectangle at position (100, 76) then Places a green dot at position (15, 88) then Draws a purple line from (379, 189) to (215, 18).
; PLAN: r0=100(x), r1=76(y), r2=45(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=15(x), r6=88(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=379(x1), r11=189(y1), r12=215(x2), r13=18(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 76
LDI r2, 45
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 15
LDI r6, 88
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 379
LDI r11, 189
LDI r12, 215
LDI r13, 18
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
