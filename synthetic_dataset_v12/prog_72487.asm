; DESCRIPTION: Composite: Renders a orange line between points (105, 210) and (164, 207) then Creates a magenta rectangular region at (340, 215) spanning 17 by 18 pixels then Places a orange dot at position (168, 106).
; PLAN: r0=105(x1), r1=210(y1), r2=164(x2), r3=207(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=340(x), r6=215(y), r7=17(width), r8=18(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=168(x), r11=106(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 105
LDI r1, 210
LDI r2, 164
LDI r3, 207
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 340
LDI r6, 215
LDI r7, 17
LDI r8, 18
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 168
LDI r11, 106
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
