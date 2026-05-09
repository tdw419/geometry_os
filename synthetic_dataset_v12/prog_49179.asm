; DESCRIPTION: Composite: Places a green 114x70 rectangle at position (240, 155) then Draws a purple line from (425, 177) to (106, 111) then Sets a single blue pixel at (142, 232).
; PLAN: r0=240(x), r1=155(y), r2=114(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=425(x1), r6=177(y1), r7=106(x2), r8=111(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=142(x), r11=232(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 155
LDI r2, 114
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 425
LDI r6, 177
LDI r7, 106
LDI r8, 111
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 142
LDI r11, 232
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
