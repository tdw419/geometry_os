; DESCRIPTION: Composite: Draws a red line from (196, 117) to (473, 169) then Places a magenta dot at position (65, 30) then Renders a black box of size 95x31 starting at (170, 146).
; PLAN: r0=196(x1), r1=117(y1), r2=473(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=65(x), r6=30(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=170(x), r11=146(y), r12=95(width), r13=31(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 117
LDI r2, 473
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 65
LDI r6, 30
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 170
LDI r11, 146
LDI r12, 95
LDI r13, 31
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
