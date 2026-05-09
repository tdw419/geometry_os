; DESCRIPTION: Composite: Creates a magenta rectangular region at (345, 0) spanning 69 by 91 pixels then Renders a black line between points (349, 25) and (429, 185) then Sets a single white pixel at (232, 184).
; PLAN: r0=345(x), r1=0(y), r2=69(width), r3=91(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=349(x1), r6=25(y1), r7=429(x2), r8=185(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=232(x), r11=184(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 0
LDI r2, 69
LDI r3, 91
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 349
LDI r6, 25
LDI r7, 429
LDI r8, 185
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 232
LDI r11, 184
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
