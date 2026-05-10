; DESCRIPTION: Composite: Creates a magenta rectangular region at (204, 95) spanning 113 by 106 pixels then Places a magenta line segment connecting (209, 121) to (195, 142) then Sets a single white pixel at (308, 96).
; PLAN: r0=204(x), r1=95(y), r2=113(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x1), r6=121(y1), r7=195(x2), r8=142(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=308(x), r11=96(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 204
LDI r1, 95
LDI r2, 113
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 121
LDI r7, 195
LDI r8, 142
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 308
LDI r11, 96
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
