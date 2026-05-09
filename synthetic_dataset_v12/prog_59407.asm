; DESCRIPTION: Composite: Draws a orange line from (74, 10) to (247, 229) then Places a orange dot at position (355, 29) then Renders a cyan box of size 93x37 starting at (369, 219).
; PLAN: r0=74(x1), r1=10(y1), r2=247(x2), r3=229(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=355(x), r6=29(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=369(x), r11=219(y), r12=93(width), r13=37(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 74
LDI r1, 10
LDI r2, 247
LDI r3, 229
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 355
LDI r6, 29
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 369
LDI r11, 219
LDI r12, 93
LDI r13, 37
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
