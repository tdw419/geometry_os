; DESCRIPTION: Composite: Creates a black rectangular region at (384, 133) spanning 107 by 45 pixels then Renders a magenta line between points (170, 40) and (369, 110) then Places a cyan dot at position (156, 122).
; PLAN: r0=384(x), r1=133(y), r2=107(width), r3=45(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=170(x1), r6=40(y1), r7=369(x2), r8=110(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=122(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 384
LDI r1, 133
LDI r2, 107
LDI r3, 45
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 40
LDI r7, 369
LDI r8, 110
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 122
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
