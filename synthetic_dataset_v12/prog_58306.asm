; DESCRIPTION: Composite: Draws a orange line from (401, 213) to (266, 58) then Places a orange dot at position (444, 122) then Renders a yellow box of size 98x119 starting at (306, 67).
; PLAN: r0=401(x1), r1=213(y1), r2=266(x2), r3=58(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=444(x), r6=122(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=306(x), r11=67(y), r12=98(width), r13=119(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 401
LDI r1, 213
LDI r2, 266
LDI r3, 58
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 444
LDI r6, 122
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 306
LDI r11, 67
LDI r12, 98
LDI r13, 119
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
