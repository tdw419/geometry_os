; DESCRIPTION: Composite: Renders a white line between points (283, 114) and (65, 136) then Creates a cyan rectangular region at (368, 68) spanning 29 by 31 pixels then Sets a single purple pixel at (225, 108).
; PLAN: r0=283(x1), r1=114(y1), r2=65(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=68(y), r7=29(width), r8=31(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=225(x), r11=108(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 114
LDI r2, 65
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 68
LDI r7, 29
LDI r8, 31
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 108
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
