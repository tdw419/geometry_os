; DESCRIPTION: Composite: Creates a red rectangular region at (394, 218) spanning 106 by 35 pixels then Places a yellow line segment connecting (350, 17) to (132, 14).
; PLAN: r0=394(x), r1=218(y), r2=106(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=350(x1), r6=17(y1), r7=132(x2), r8=14(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 394
LDI r1, 218
LDI r2, 106
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 17
LDI r7, 132
LDI r8, 14
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
