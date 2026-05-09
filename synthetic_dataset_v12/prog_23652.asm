; DESCRIPTION: Composite: Renders a black box of size 51x87 starting at (68, 107) then Renders a magenta line between points (74, 170) and (333, 145) then Places a green dot at position (366, 212).
; PLAN: r0=68(x), r1=107(y), r2=51(width), r3=87(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=74(x1), r6=170(y1), r7=333(x2), r8=145(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=366(x), r11=212(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 68
LDI r1, 107
LDI r2, 51
LDI r3, 87
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 74
LDI r6, 170
LDI r7, 333
LDI r8, 145
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 366
LDI r11, 212
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
