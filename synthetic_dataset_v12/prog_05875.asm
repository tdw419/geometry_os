; DESCRIPTION: Composite: Places a purple circle of radius 46 at center (240, 46) then Draws a magenta line from (216, 176) to (172, 32) then Places a black dot at position (281, 74).
; PLAN: r0=240(x), r1=46(y), r2=46(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x1), r6=176(y1), r7=172(x2), r8=32(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=74(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 46
LDI r2, 46
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 176
LDI r7, 172
LDI r8, 32
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 74
LDI r12, 0x000000
PSET r10, r11, r12
HALT
