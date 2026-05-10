; DESCRIPTION: Composite: Places a orange dot at position (98, 166) then Draws a orange line from (435, 87) to (90, 121) then Draws a black rectangle at (219, 174) with width 74 and height 51.
; PLAN: r0=98(x), r1=166(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=435(x1), r6=87(y1), r7=90(x2), r8=121(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=219(x), r11=174(y), r12=74(width), r13=51(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 98
LDI r1, 166
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 435
LDI r6, 87
LDI r7, 90
LDI r8, 121
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 174
LDI r12, 74
LDI r13, 51
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
