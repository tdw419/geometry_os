; DESCRIPTION: Composite: Creates a purple rectangular region at (367, 72) spanning 49 by 89 pixels then Sets a single green pixel at (322, 213) then Renders a yellow line between points (268, 236) and (485, 150).
; PLAN: r0=367(x), r1=72(y), r2=49(width), r3=89(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=322(x), r6=213(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=268(x1), r11=236(y1), r12=485(x2), r13=150(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 72
LDI r2, 49
LDI r3, 89
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 322
LDI r6, 213
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 268
LDI r11, 236
LDI r12, 485
LDI r13, 150
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
