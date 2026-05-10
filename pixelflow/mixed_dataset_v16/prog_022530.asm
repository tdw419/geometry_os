; DESCRIPTION: Composite: Places a orange dot at position (415, 51) then Draws a orange line from (204, 198) to (145, 133) then Renders a green box of size 36x51 starting at (178, 71).
; PLAN: r0=415(x), r1=51(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=204(x1), r6=198(y1), r7=145(x2), r8=133(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=178(x), r11=71(y), r12=36(width), r13=51(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 415
LDI r1, 51
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 204
LDI r6, 198
LDI r7, 145
LDI r8, 133
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 71
LDI r12, 36
LDI r13, 51
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
