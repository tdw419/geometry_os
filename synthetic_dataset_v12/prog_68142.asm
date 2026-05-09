; DESCRIPTION: Composite: Renders a white box of size 82x77 starting at (430, 145) then Draws a magenta line from (311, 209) to (275, 134) then Sets a single orange pixel at (455, 93).
; PLAN: r0=430(x), r1=145(y), r2=82(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=311(x1), r6=209(y1), r7=275(x2), r8=134(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=455(x), r11=93(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 430
LDI r1, 145
LDI r2, 82
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 209
LDI r7, 275
LDI r8, 134
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 455
LDI r11, 93
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
