; DESCRIPTION: Composite: Creates a green rectangular region at (130, 27) spanning 20 by 88 pixels then Draws a yellow line from (151, 251) to (1, 29) then Places a green dot at position (130, 125).
; PLAN: r0=130(x), r1=27(y), r2=20(width), r3=88(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x1), r6=251(y1), r7=1(x2), r8=29(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=130(x), r11=125(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 130
LDI r1, 27
LDI r2, 20
LDI r3, 88
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 251
LDI r7, 1
LDI r8, 29
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 130
LDI r11, 125
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
