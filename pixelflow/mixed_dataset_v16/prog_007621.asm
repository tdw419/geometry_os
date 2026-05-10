; DESCRIPTION: Composite: Creates a magenta circular shape at (151, 159) with radius 79 then Draws a yellow line from (488, 216) to (283, 201) then Sets a single white pixel at (122, 166).
; PLAN: r0=151(x), r1=159(y), r2=79(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=488(x1), r6=216(y1), r7=283(x2), r8=201(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=122(x), r11=166(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 151
LDI r1, 159
LDI r2, 79
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 488
LDI r6, 216
LDI r7, 283
LDI r8, 201
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 166
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
