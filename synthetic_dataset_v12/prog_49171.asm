; DESCRIPTION: Composite: Places a yellow 72x87 rectangle at position (328, 26) then Draws a white line from (142, 235) to (390, 148) then Places a green dot at position (23, 65).
; PLAN: r0=328(x), r1=26(y), r2=72(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=142(x1), r6=235(y1), r7=390(x2), r8=148(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=23(x), r11=65(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 328
LDI r1, 26
LDI r2, 72
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 142
LDI r6, 235
LDI r7, 390
LDI r8, 148
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 23
LDI r11, 65
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
