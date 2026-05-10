; DESCRIPTION: Composite: Renders a white line between points (426, 127) and (470, 245) then Creates a magenta rectangular region at (164, 199) spanning 91 by 38 pixels then Places a red dot at position (458, 20).
; PLAN: r0=426(x1), r1=127(y1), r2=470(x2), r3=245(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=164(x), r6=199(y), r7=91(width), r8=38(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=458(x), r11=20(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 426
LDI r1, 127
LDI r2, 470
LDI r3, 245
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 164
LDI r6, 199
LDI r7, 91
LDI r8, 38
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 458
LDI r11, 20
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
