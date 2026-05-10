; DESCRIPTION: Composite: Places a orange 33x50 rectangle at position (68, 66) then Places a black dot at position (130, 230) then Draws a purple line from (196, 185) to (138, 223).
; PLAN: r0=68(x), r1=66(y), r2=33(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=230(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=196(x1), r11=185(y1), r12=138(x2), r13=223(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 68
LDI r1, 66
LDI r2, 33
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 230
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 196
LDI r11, 185
LDI r12, 138
LDI r13, 223
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
