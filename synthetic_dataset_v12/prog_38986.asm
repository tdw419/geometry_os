; DESCRIPTION: Composite: Renders a green box of size 30x106 starting at (212, 41) then Places a black dot at position (242, 83) then Draws a yellow line from (309, 51) to (419, 223).
; PLAN: r0=212(x), r1=41(y), r2=30(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=242(x), r6=83(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=309(x1), r11=51(y1), r12=419(x2), r13=223(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 212
LDI r1, 41
LDI r2, 30
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 242
LDI r6, 83
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 309
LDI r11, 51
LDI r12, 419
LDI r13, 223
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
