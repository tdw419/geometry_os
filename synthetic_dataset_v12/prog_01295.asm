; DESCRIPTION: Composite: Renders a purple box of size 59x72 starting at (301, 122) then Draws a magenta line from (345, 66) to (170, 121) then Places a blue dot at position (351, 184).
; PLAN: r0=301(x), r1=122(y), r2=59(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=345(x1), r6=66(y1), r7=170(x2), r8=121(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=351(x), r11=184(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 301
LDI r1, 122
LDI r2, 59
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 345
LDI r6, 66
LDI r7, 170
LDI r8, 121
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 351
LDI r11, 184
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
