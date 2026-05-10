; DESCRIPTION: Composite: Renders a orange line between points (237, 167) and (230, 19) then Creates a cyan rectangular region at (145, 62) spanning 29 by 98 pixels then Places a cyan dot at position (120, 164).
; PLAN: r0=237(x1), r1=167(y1), r2=230(x2), r3=19(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=145(x), r6=62(y), r7=29(width), r8=98(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=120(x), r11=164(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 237
LDI r1, 167
LDI r2, 230
LDI r3, 19
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 145
LDI r6, 62
LDI r7, 29
LDI r8, 98
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 120
LDI r11, 164
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
