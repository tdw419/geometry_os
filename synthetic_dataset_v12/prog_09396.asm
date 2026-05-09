; DESCRIPTION: Composite: Places a green line segment connecting (51, 6) to (85, 251) then Creates a blue rectangular region at (84, 100) spanning 42 by 70 pixels then Sets a single white pixel at (234, 146).
; PLAN: r0=51(x1), r1=6(y1), r2=85(x2), r3=251(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=84(x), r6=100(y), r7=42(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=146(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 6
LDI r2, 85
LDI r3, 251
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 100
LDI r7, 42
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 146
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
