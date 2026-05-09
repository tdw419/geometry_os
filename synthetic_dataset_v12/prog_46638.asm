; DESCRIPTION: Composite: Creates a cyan rectangular region at (422, 135) spanning 82 by 22 pixels then Places a white dot at position (196, 96) then Renders a orange line between points (158, 173) and (490, 145).
; PLAN: r0=422(x), r1=135(y), r2=82(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=196(x), r6=96(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=158(x1), r11=173(y1), r12=490(x2), r13=145(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 422
LDI r1, 135
LDI r2, 82
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 196
LDI r6, 96
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 158
LDI r11, 173
LDI r12, 490
LDI r13, 145
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
