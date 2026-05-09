; DESCRIPTION: Composite: Draws a magenta rectangle at (132, 128) with width 84 and height 51 then Renders a orange line between points (197, 99) and (400, 208) then Places a cyan dot at position (388, 235).
; PLAN: r0=132(x), r1=128(y), r2=84(width), r3=51(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x1), r6=99(y1), r7=400(x2), r8=208(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=388(x), r11=235(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 128
LDI r2, 84
LDI r3, 51
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 99
LDI r7, 400
LDI r8, 208
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 388
LDI r11, 235
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
