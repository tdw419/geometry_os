; DESCRIPTION: Composite: Creates a orange rectangular region at (340, 71) spanning 14 by 73 pixels then Draws a blue line from (298, 163) to (33, 90) then Places a black dot at position (43, 52).
; PLAN: r0=340(x), r1=71(y), r2=14(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x1), r6=163(y1), r7=33(x2), r8=90(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=43(x), r11=52(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 71
LDI r2, 14
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 163
LDI r7, 33
LDI r8, 90
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 52
LDI r12, 0x000000
PSET r10, r11, r12
HALT
