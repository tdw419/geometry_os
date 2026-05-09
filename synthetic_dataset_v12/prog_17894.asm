; DESCRIPTION: Composite: Renders a purple line between points (217, 45) and (207, 120) then Creates a orange rectangular region at (258, 157) spanning 61 by 58 pixels then Places a yellow dot at position (488, 250).
; PLAN: r0=217(x1), r1=45(y1), r2=207(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=258(x), r6=157(y), r7=61(width), r8=58(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=488(x), r11=250(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 217
LDI r1, 45
LDI r2, 207
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 258
LDI r6, 157
LDI r7, 61
LDI r8, 58
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 250
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
