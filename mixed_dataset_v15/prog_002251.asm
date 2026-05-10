; DESCRIPTION: Composite: Renders a yellow line between points (391, 227) and (464, 117) then Renders a red box of size 111x96 starting at (357, 110) then Sets a single green pixel at (408, 233).
; PLAN: r0=391(x1), r1=227(y1), r2=464(x2), r3=117(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=357(x), r6=110(y), r7=111(width), r8=96(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=408(x), r11=233(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 227
LDI r2, 464
LDI r3, 117
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 357
LDI r6, 110
LDI r7, 111
LDI r8, 96
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 408
LDI r11, 233
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
