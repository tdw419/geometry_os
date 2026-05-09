; DESCRIPTION: Composite: Places a orange 15x39 rectangle at position (362, 25) then Renders a magenta line between points (222, 230) and (77, 110) then Places a black dot at position (444, 200).
; PLAN: r0=362(x), r1=25(y), r2=15(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=222(x1), r6=230(y1), r7=77(x2), r8=110(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=444(x), r11=200(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 362
LDI r1, 25
LDI r2, 15
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 222
LDI r6, 230
LDI r7, 77
LDI r8, 110
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 444
LDI r11, 200
LDI r12, 0x000000
PSET r10, r11, r12
HALT
