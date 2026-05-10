; DESCRIPTION: Composite: Creates a purple rectangular region at (71, 48) spanning 29 by 70 pixels then Places a magenta line segment connecting (151, 201) to (411, 209) then Sets a single cyan pixel at (101, 203).
; PLAN: r0=71(x), r1=48(y), r2=29(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x1), r6=201(y1), r7=411(x2), r8=209(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=101(x), r11=203(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 71
LDI r1, 48
LDI r2, 29
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 201
LDI r7, 411
LDI r8, 209
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 101
LDI r11, 203
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
