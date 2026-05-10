; DESCRIPTION: Composite: Creates a cyan rectangular region at (33, 126) spanning 27 by 83 pixels then Sets a single blue pixel at (66, 135) then Places a purple line segment connecting (393, 208) to (317, 97).
; PLAN: r0=33(x), r1=126(y), r2=27(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=66(x), r6=135(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=393(x1), r11=208(y1), r12=317(x2), r13=97(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 33
LDI r1, 126
LDI r2, 27
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 66
LDI r6, 135
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 393
LDI r11, 208
LDI r12, 317
LDI r13, 97
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
