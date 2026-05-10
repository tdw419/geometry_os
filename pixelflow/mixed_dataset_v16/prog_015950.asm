; DESCRIPTION: Composite: Draws a black line from (198, 20) to (339, 138) then Places a purple dot at position (459, 39) then Places a magenta 60x68 rectangle at position (48, 185).
; PLAN: r0=198(x1), r1=20(y1), r2=339(x2), r3=138(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=459(x), r6=39(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=48(x), r11=185(y), r12=60(width), r13=68(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 20
LDI r2, 339
LDI r3, 138
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 459
LDI r6, 39
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 48
LDI r11, 185
LDI r12, 60
LDI r13, 68
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
