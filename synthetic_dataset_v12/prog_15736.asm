; DESCRIPTION: Composite: Sets a single white pixel at (430, 236) then Renders a green line between points (289, 138) and (11, 214) then Draws a purple rectangle at (311, 125) with width 50 and height 102.
; PLAN: r0=430(x), r1=236(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=289(x1), r6=138(y1), r7=11(x2), r8=214(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=311(x), r11=125(y), r12=50(width), r13=102(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 430
LDI r1, 236
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 138
LDI r7, 11
LDI r8, 214
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 311
LDI r11, 125
LDI r12, 50
LDI r13, 102
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
