; DESCRIPTION: Composite: Draws a blue rectangle at (218, 143) with width 75 and height 33 then Places a orange dot at position (1, 238) then Draws a blue line from (69, 194) to (504, 245).
; PLAN: r0=218(x), r1=143(y), r2=75(width), r3=33(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=1(x), r6=238(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=69(x1), r11=194(y1), r12=504(x2), r13=245(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 218
LDI r1, 143
LDI r2, 75
LDI r3, 33
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 1
LDI r6, 238
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 69
LDI r11, 194
LDI r12, 504
LDI r13, 245
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
