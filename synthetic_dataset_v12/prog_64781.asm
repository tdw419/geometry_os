; DESCRIPTION: Composite: Renders a green line between points (125, 237) and (83, 70) then Places a green dot at position (295, 241) then Creates a black rectangular region at (15, 111) spanning 110 by 23 pixels.
; PLAN: r0=125(x1), r1=237(y1), r2=83(x2), r3=70(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=295(x), r6=241(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=15(x), r11=111(y), r12=110(width), r13=23(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 237
LDI r2, 83
LDI r3, 70
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 295
LDI r6, 241
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 15
LDI r11, 111
LDI r12, 110
LDI r13, 23
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
