; DESCRIPTION: Composite: Creates a orange rectangular region at (362, 78) spanning 97 by 65 pixels then Places a green dot at position (55, 235) then Renders a cyan line between points (319, 112) and (255, 166).
; PLAN: r0=362(x), r1=78(y), r2=97(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x), r6=235(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=319(x1), r11=112(y1), r12=255(x2), r13=166(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 78
LDI r2, 97
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 235
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 319
LDI r11, 112
LDI r12, 255
LDI r13, 166
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
