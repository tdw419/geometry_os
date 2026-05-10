; DESCRIPTION: Composite: Places a green dot at position (13, 116) then Places a purple 45x79 rectangle at position (32, 40) then Places a orange line segment connecting (75, 205) to (471, 186).
; PLAN: r0=13(x), r1=116(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=40(y), r7=45(width), r8=79(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=75(x1), r11=205(y1), r12=471(x2), r13=186(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 13
LDI r1, 116
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 32
LDI r6, 40
LDI r7, 45
LDI r8, 79
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 75
LDI r11, 205
LDI r12, 471
LDI r13, 186
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
