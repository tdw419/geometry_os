; DESCRIPTION: Composite: Creates a yellow rectangular region at (185, 21) spanning 37 by 79 pixels then Places a green line segment connecting (195, 127) to (108, 161).
; PLAN: r0=185(x), r1=21(y), r2=37(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x1), r6=127(y1), r7=108(x2), r8=161(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 21
LDI r2, 37
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 127
LDI r7, 108
LDI r8, 161
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
