; DESCRIPTION: Composite: Sets a single green pixel at (340, 75) then Creates a black rectangular region at (176, 122) spanning 68 by 32 pixels then Renders a purple line between points (20, 125) and (446, 233).
; PLAN: r0=340(x), r1=75(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=122(y), r7=68(width), r8=32(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=20(x1), r11=125(y1), r12=446(x2), r13=233(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 75
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 176
LDI r6, 122
LDI r7, 68
LDI r8, 32
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 20
LDI r11, 125
LDI r12, 446
LDI r13, 233
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
