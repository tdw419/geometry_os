; DESCRIPTION: Composite: Creates a magenta rectangular region at (315, 67) spanning 46 by 90 pixels then Sets a single black pixel at (41, 254) then Draws a yellow line from (345, 168) to (485, 127).
; PLAN: r0=315(x), r1=67(y), r2=46(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=41(x), r6=254(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=345(x1), r11=168(y1), r12=485(x2), r13=127(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 67
LDI r2, 46
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 254
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 345
LDI r11, 168
LDI r12, 485
LDI r13, 127
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
