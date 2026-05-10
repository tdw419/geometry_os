; DESCRIPTION: Composite: Renders a blue box of size 29x40 starting at (16, 125) then Draws a purple line from (371, 84) to (230, 0) then Sets a single orange pixel at (281, 8).
; PLAN: r0=16(x), r1=125(y), r2=29(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=371(x1), r6=84(y1), r7=230(x2), r8=0(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=281(x), r11=8(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 16
LDI r1, 125
LDI r2, 29
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 371
LDI r6, 84
LDI r7, 230
LDI r8, 0
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 281
LDI r11, 8
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
