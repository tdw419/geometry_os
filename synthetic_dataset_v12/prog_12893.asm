; DESCRIPTION: Composite: Creates a green rectangular region at (292, 141) spanning 110 by 71 pixels then Draws a orange line from (70, 64) to (286, 152) then Sets a single white pixel at (401, 44).
; PLAN: r0=292(x), r1=141(y), r2=110(width), r3=71(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=70(x1), r6=64(y1), r7=286(x2), r8=152(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=401(x), r11=44(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 141
LDI r2, 110
LDI r3, 71
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 70
LDI r6, 64
LDI r7, 286
LDI r8, 152
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 401
LDI r11, 44
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
