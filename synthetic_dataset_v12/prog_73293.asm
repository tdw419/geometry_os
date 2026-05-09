; DESCRIPTION: Composite: Draws a cyan circle centered at (279, 75) with radius 15 then Draws a orange line from (127, 223) to (173, 68) then Places a purple 41x19 rectangle at position (237, 120).
; PLAN: r0=279(x), r1=75(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=127(x1), r6=223(y1), r7=173(x2), r8=68(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=237(x), r11=120(y), r12=41(width), r13=19(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 75
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 127
LDI r6, 223
LDI r7, 173
LDI r8, 68
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 237
LDI r11, 120
LDI r12, 41
LDI r13, 19
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
