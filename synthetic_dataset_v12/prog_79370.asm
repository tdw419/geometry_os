; DESCRIPTION: Composite: Sets a single black pixel at (272, 147) then Places a green 63x69 rectangle at position (199, 132) then Draws a blue line from (86, 235) to (57, 29).
; PLAN: r0=272(x), r1=147(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=199(x), r6=132(y), r7=63(width), r8=69(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=86(x1), r11=235(y1), r12=57(x2), r13=29(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 272
LDI r1, 147
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 199
LDI r6, 132
LDI r7, 63
LDI r8, 69
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 86
LDI r11, 235
LDI r12, 57
LDI r13, 29
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
